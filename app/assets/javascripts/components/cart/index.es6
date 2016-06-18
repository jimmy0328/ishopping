window.Cart = ( window.Cart || {} );
window.Cart.Index = class Index extends React.Component{

  constructor(props){
    super(props);
  }

  render(){
    return(
      <div>
        <table className="table table-bordered">
          <thead>
            <tr>
              <th>商品資訊</th>
              <th>名稱</th>
              <th>單價</th>
            </tr>
          </thead>
          <tbody>
           {this.props.cart.items.map( (product) => {
             return <tr>
                <td>
                  <img className="thumbnail" src={product.cover_image.cover.url} />
                </td>
                <td>
                  <a href={`/products/${product.permalink}`} >{product.title} </a>
                </td>
                <td>
                  {product.price}
                </td>
              </tr>
           })}
          </tbody>
        </table>
      </div>
    );
  }

}
