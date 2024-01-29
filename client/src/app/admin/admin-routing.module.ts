import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminComponent } from './admin.component';
import { AddProductComponent } from './add-product/add-product.component';
import { ProductListComponent } from './product-list/product-list.component';

const routes: Routes = [
  {path:'',component: AdminComponent},
  {path:'Add-Product',component: AddProductComponent, data: {breadcrumb: {alias: 'Add Product'}}},
  {path:'Product-List', component: ProductListComponent}
]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(routes),
  ],
  exports: [
    RouterModule
  ]
})
export class AdminRoutingModule { }
