import { Component, Input } from '@angular/core';
import { AccountService } from 'src/app/account/account.service';
import { BasketService } from 'src/app/basket/basket.service';
import { Product } from 'src/app/shared/models/product';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-product-item',
  templateUrl: './product-item.component.html',
  styleUrls: ['./product-item.component.scss']
})
export class ProductItemComponent {
  @Input() product?: Product;

  constructor(private basketservice: BasketService, public accountService : AccountService,private toastr: ToastrService){}

  addItemToBasket(){
    this.toastr.success('Item Added to the Cart');
    this.product && this.basketservice.addItemToBasket(this.product);
  }

  getDiscountedPrice(item: Product ){
    const price =  item.price - (item.price * item.discount) / 100
    return price;
 }
}
