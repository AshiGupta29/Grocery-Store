import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, NgForm, Validators } from '@angular/forms';
import { ProductCreate } from 'src/app/shared/models/productCreate';
import { AdminService } from '../admin.service';
import { ToastrService } from 'ngx-toastr';
import { ModalDismissReasons, NgbDate, NgbModal, NgbModalRef, NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { HttpClient } from '@angular/common/http';
import { ProductNames } from 'src/app/shared/models/productNames';

@Component({
  selector: 'app-add-product',
  templateUrl: './add-product.component.html',
  styleUrls: ['./add-product.component.scss']
})
export class AddProductComponent implements OnInit{
  errors: string[] | null = null;
  closeResult = '';
  addProduct!: FormGroup;
  // selectedDate: NgbDate | null = null;
  productModalRef: NgbModalRef | null = null;
  productForm!: FormGroup;
  productNames: string[] | null = null;

  constructor(private fb: FormBuilder, private adminService : AdminService, private toastr: ToastrService,
    private modalService: NgbModal,private http: HttpClient){}

  ngOnInit() {
    this.addProduct = this.fb.group({
      name: ['', [Validators.required, Validators.maxLength(100), Validators.pattern(/^[a-zA-Z0-9\s]+$/)]],
      description: ['', [Validators.required, Validators.maxLength(255), Validators.pattern(/^[a-zA-Z0-9,.\s]+$/)]],
      productCategory: ['', [Validators.required, Validators.maxLength(100), Validators.pattern(/^[a-zA-Z0-9,\s]+$/)]],
      quantity: ['', [Validators.required, Validators.pattern(/^\d+$/)]],
      imageUrl: ['', [Validators.required, Validators.pattern(/.*\.(?:png|jpg)/i)]],
      price: ['', [Validators.required, Validators.pattern(/^\d+(\.\d{1,2})?$/)]],
      discount: ['', [Validators.pattern(/^\d+(\.\d{1,2})?$/)]],
      productSpecification: ['', [Validators.maxLength(100)]]
    }),
    this.productForm = this.fb.group({
      month:['', [Validators.required,Validators.maxLength(2), Validators.pattern(/^(0?[1-9]|1[012])$/)]],
      year:['', [Validators.required, Validators.pattern(/^(19|20)\d{2}$/)]],
    });
  }

  resetForm() {
    this.addProduct.reset(); // Reset the form to its initial state
  }

  onSubmit(addProductForm: FormGroup) {
    if (addProductForm.valid) {
      // Create the product object with the form inputs
      const product: ProductCreate = {
        name: addProductForm.value.name,
        description: addProductForm.value.description,
        productCategoryId: this.getProductCategoryId(addProductForm.value.productCategory),
        quantity: addProductForm.value.quantity,
        imageUrl: this.trimUrl(addProductForm.value.imageUrl),
        price: addProductForm.value.price,
        discount: addProductForm.value.discount || 0, // Default value of 0 if discount is null
        productSpecification: addProductForm.value.productSpecification,
      };

      // Call the service method to add the product
      this.adminService.addProduct(product).subscribe(
        () => {
          this.toastr.success('Product added Successfully');
          // Refresh the page or perform any other necessary actions
          addProductForm.reset();
        },
        (error) => {
          console.error('Error adding product:', error);
        }
      );
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

  openMainModal(content: any) {
    const currentDate = new Date();
    this.productForm.patchValue({
      month: currentDate.getMonth() + 1,
      year: currentDate.getFullYear(),
      view: this.onDateSelect(this.productForm)
    });
    this.onDateSelect(this.productForm);
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

  onDateSelect(productForm: FormGroup) {
    if(productForm.valid){
     const month: number = productForm.value.month;
     const year: number = productForm.value.year;

      // Make the HTTP GET request to fetch the most ordered products
    this.http.get<string[]>(`https://localhost:5001/api/orders/most-ordered-products/${month}/${year}`)
    .subscribe(
      (products) => {
        this.productNames = products;
      },
      (error) => {
        console.error('Error getting most ordered products:', error);
      }
    );
    }
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

}
