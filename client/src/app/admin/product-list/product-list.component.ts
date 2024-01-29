import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Product } from 'src/app/shared/models/product';
import { AdminService } from '../admin.service';
import { ToastrService } from 'ngx-toastr';
import { ProductCreate } from 'src/app/shared/models/productCreate';

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.scss'],
})
export class ProductListComponent implements OnInit {
  @Input() product?: Product;

  errors: string[] | null = null;
  closeResult = '';
  productForm!: FormGroup;
  constructor(
    private modalService: NgbModal,
    private fb: FormBuilder,
    private adminService: AdminService,
    private toastr: ToastrService
  ) {}

  ngOnInit() {
    this.productForm = this.fb.group({
      name: [
        '',
        [
          Validators.required,
          Validators.maxLength(100),
          Validators.pattern(/^[a-zA-Z0-9\s]+$/),
        ],
      ],
      description: [
        '',
        [
          Validators.required,
          Validators.maxLength(255),
          Validators.pattern(/^[a-zA-Z0-9,.\s]+$/),
        ],
      ],
      productCategory: [
        '',
        [
          Validators.required,
          Validators.maxLength(100),
          Validators.pattern(/^[a-zA-Z0-9,\s]+$/),
        ],
      ],
      quantity: ['', [Validators.required, Validators.pattern(/^\d+$/)]],
      imageUrl: [
        '',
        [
          Validators.required,
          Validators.pattern(/(https?:\/\/.*\.(?:png|jpg))/i),
        ],
      ],
      price: [
        '',
        [Validators.required, Validators.pattern(/^\d+(\.\d{1,2})?$/)],
      ],
      discount: ['', [Validators.pattern(/^\d+(\.\d{1,2})?$/)]],
      productSpecification: ['', [Validators.maxLength(100)]],
    });
  }

  
  deleteProduct(id: number) {
    this.adminService.deleteProduct(id).subscribe(
      () => {
        this.toastr.success('Product deleted successfully');
        window.location.reload();
        // Handle any further actions or UI updates
      },
      (error: any) => {
        this.toastr.warning('Error deleting product:', error);
        // Handle the error
      }
    );
  }

  onSubmit(id: number, productForm: FormGroup) {
    if (productForm.valid) {
      // Create the product object with the form inputs
      const productCreate: ProductCreate = {
        name: productForm.value.name,
        description: productForm.value.description,
        productCategoryId: this.getProductCategoryId(
          productForm.value.productCategory
        ),
        quantity: productForm.value.quantity,
        imageUrl: this.trimUrl(productForm.value.imageUrl),
        price: productForm.value.price,
        discount: productForm.value.discount || 0, // Default value of 0 if discount is null
        productSpecification: productForm.value.productSpecification,
      };

      this.adminService.UpdateProduct(id, productCreate).subscribe(
        (response) => {
          this.toastr.success('Product updated Successfully');
          window.location.reload();
        },
        (error) => {
          console.error('Error adding product:', error);
        }
      );
    }
  }

  open(content: any) {
    this.productForm.patchValue({
      name: this.product?.name,
      description: this.product?.description,
      productCategory: this.product?.productCategory,
      quantity: this.product?.quantity,
      imageUrl: this.product?.imageUrl,
      price: this.product?.price,
      discount: this.product?.discount,
      productSpecification: this.product?.productSpecification,
    });

    this.modalService
      .open(content, { ariaLabelledBy: 'modal-basic-title' })
      .result.then(
        (result) => {
          this.closeResult = `Closed with: ${result}`;
        },
        (reason) => {
          this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
        }
      );
  }

  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }

  private getProductCategoryId(categoryName: string): number {
    switch (categoryName) {
      case 'Fruits and Vegetables':
        return 1;
      case 'Bakery, Cakes and Dairy':
        return 2;
      case 'Beverages':
        return 3;
      case 'Snacks':
        return 4;
      case 'Eggs, Meat and Fish':
        return 5;
      case 'Foodgrains, Oil and Masala':
        return 6;
      default:
        return 0;
    }
  }

  private trimUrl(url: string): string {
    const startIndex = url.indexOf('/', url.indexOf('//') + 2);
    if (startIndex !== -1) {
      return url.substring(startIndex + 1);
    }
    return url;
  }
}
