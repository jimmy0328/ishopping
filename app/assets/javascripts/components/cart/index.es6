window.Cart = ( window.Cart || {} );
window.Cart.Index = class Index extends React.Component{

  constructor(props){
    super(props);
    state: {
      cart: this.props.cart;
    }
  }

  render(){
    return(
      <div>
        <table className="table table-bordered">
          <thead>
            <tr>
              <th>商品資訊</th>
              <th>名稱</th>
              <th>數量</th>
              <th>單價</th>
              <th>小計</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
           {this.props.cart.cart_items.map( (item) => {
             return <Cart.Row key={item.id} item={item} />
           })}
          </tbody>
        </table>
      </div>
    );
  }

}
