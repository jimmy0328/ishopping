window.Cart = ( window.Cart || {} );
window.Cart.Index = class Index extends React.Component{

  constructor(props){
    super(props);
  }

  submit(e){
    $.ajax(`/items/${e.target.value}`,{
      method: "delete",
      dataType: "json",
      contentType: "application/json",
      data: JSON.stringify({ product: e.target.value, authenticity_token: document.querySelector("meta[name=csrf-token]").content}),
      success: (data) =>{ location.reload(true) }
    });
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
              <th></th>
            </tr>
          </thead>
          <tbody>
           {this.props.cart.items.map( (product) => {
             return <tr key={product.id}>
                <td>
                  <a href={`/products/${product.permalink}`} >
                    <img className="thumbnail" src={product.cover_image.cover.url} />
                  </a>
                </td>
                <td>
                  <a href={`/products/${product.permalink}`} >{product.title} </a>
                </td>
                <td>
                  {product.price}
                </td>
                <td>
                   <button className="fa fa-trash" value={product.id} onClick={this.submit.bind(this)}/>
                </td>
              </tr>
           })}
          </tbody>
        </table>
      </div>
    );
  }

}
