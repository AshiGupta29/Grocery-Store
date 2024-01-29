import { Component } from '@angular/core';
import { BasketService } from './basket.service';
import { Basket, BasketItem } from '../shared/models/basket';
import { ToastrService } from 'ngx-toastr';
import { NavigationExtras, Router } from '@angular/router';

@Component({
  selector: 'app-basket',
  templateUrl: './basket.component.html',
  styleUrls: ['./basket.component.scss']
})
export class BasketComponent {
  constructor(public basketService: BasketService, private toastr: ToastrService, private router: Router){}


  incrementQuantity(item: BasketItem){
    this.basketService.addItemToBasket(item);
  }

  removeItem(id: number, quantity: number){
    this.basketService.removeItemsfromBasket(id, quantity);
  }

  submitOrder() {
    const basket = this.basketService.getCurrentBasketValue();
    if (!basket) return;
    const orderToCreate = this.getOrderToCreate(basket);
    if (!orderToCreate) return;
    this.basketService.createOrder(orderToCreate).subscribe({
      next: order => {
        this.toastr.success('Order created successfully with order id ' + order.id);
        this.basketService.deleteLocalBasket();
        const navigationExtras: NavigationExtras = {state: order};
        this.router.navigate(['checkout/success'], navigationExtras);
      }
    })
  }

  private getOrderToCreate(basket: Basket) {
    return {
      basketId: basket.id
    }
  }
}
