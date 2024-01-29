import { Component, OnInit } from '@angular/core';
import { Product } from 'src/app/shared/models/product';
import { ShopService } from '../shop.service';
import { ActivatedRoute } from '@angular/router';
import { BreadcrumbService } from 'xng-breadcrumb';
import { BasketService } from 'src/app/basket/basket.service';
import { take } from 'rxjs';
import { AccountService } from 'src/app/account/account.service';
import { ToastrService } from 'ngx-toastr';
import { Review } from 'src/app/shared/models/review';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html',
  styleUrls: ['./product-details.component.scss'],
})
export class ProductDetailsComponent implements OnInit{
  product?: Product;
  quantity = 1;
  quantityInBasket = 0;
  reviews: Review[] = [];
  reviewForm!: FormGroup;

  constructor(private shopService: ShopService, private activatedRoute: ActivatedRoute, 
    private bcService: BreadcrumbService, private basketService: BasketService, public accountService: AccountService,private toastr: ToastrService, private fb: FormBuilder) {
      this.bcService.set('@productDetails',' ')
    }

  ngOnInit(): void {
    this.initializeReviewForm();
    this.loadProduct();
    this.loadReviews();
  }

  loadProduct(){
    const id = this.activatedRoute.snapshot.paramMap.get('id');
    if(id) this.shopService.getProduct(+id).subscribe({
      next: product => {
        this.product = product;
        this.bcService.set('@productDetails', product.name);
        this.basketService.basketSource$.pipe(take(1)).subscribe({
          next: basket => {
            const item = basket?.items.find(x => x.id === +id);
            if(item){
              this.quantity = item.quantity;
              this.quantityInBasket = item.quantity;
            }
          }
        })
      },
      error: error => console.log(error)
    })
  }

  incrementQuantity(){
    this.quantity++;
  }

  decrementQuantity(){
     this.quantity--;
  }

  updateBasket(){
    if(this.product){
      if(this.quantity > this.quantityInBasket){
        if(this.product.quantity >= this.quantity){
          const itemsToAdd = this.quantity - this.quantityInBasket;
        this.quantityInBasket += itemsToAdd;
        this.basketService.addItemToBasket(this.product, itemsToAdd);
        this.toastr.success('Cart Updated Successfully');
        }
        else{
          this.toastr.warning('Not enough stock available, Only ' + this.product.quantity + ' units left');
        }
      }else{
        if(this.quantity >= 0){
          const itemsToRemove = this.quantityInBasket - this.quantity;
        this.quantityInBasket -= itemsToRemove;
        this.basketService.removeItemsfromBasket(this.product.id, itemsToRemove);
        this.toastr.success('Cart Updated Successfully');
        }
        else{
          this.toastr.warning('Please select valid quantity');
        }
      }
    }
  }

  get buttonText(){
    return this.quantityInBasket == 0 ? 'Add to basket' : 'Update basket';
  }

  getDiscountedPrice(item: Product ){
    const price =  item.price - (item.price * item.discount) / 100
    return price;
 }
 initializeReviewForm(): void {
    this.reviewForm = this.fb.group({
      review2: ['', [Validators.required]],
    });
  }

 postReview() {
  const id = this.activatedRoute.snapshot.paramMap.get('id');
  const currentDate = new Date(Date.now());

  if(id && this.reviewForm.valid) {
    const review: Review = {
      productId: +id,
      description: this.reviewForm.value.review2,
      userEmail: '',
      datePosted: currentDate.toISOString()
    };

    this.shopService.postReview(review).subscribe(
      response => {
        this.toastr.success('Review added Successfully');
        this.reviewForm.reset();
        window.location.reload();
      },
      error => {
        console.log('Error posting review:', error);
      }
    );
  }
}


loadReviews() {
  const id = this.activatedRoute.snapshot.paramMap.get('id');
  if (id) {
    this.shopService.getReviews(+id).subscribe({
      next: (response : any) => {
        this.reviews = response;
        console.log(this.reviews);
      },
      error: (error) => console.log(error),
    });
  }
}

getUsernameFromEmail(email: string): string {
  const username = email.split('@')[0];
  return username;
}


}
