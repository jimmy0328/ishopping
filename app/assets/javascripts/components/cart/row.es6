window.Cart = ( window.Cart || {} );
window.Cart.Row = class Row extends React.Component{

  constructor(props){
    super(props);
    this.state = {
      item: this.props.item,
      typing: 0,
    }
    this.update_quantity = this.update_quantity.bind(this);
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

  detect (counter){
    console.warn(counter);
    if (this.state.typing == counter){
      this.update_quantity();
    }
  }

  change(e){
   setTimeout(this.detect.bind(this), 1000, ++this.state.typing );
   this.setState(React.addons.update(this.state, {item: { quantity: {$set: e.target.value }}}));
  }

  update_quantity(e){
    console.warn("update quantity")
    $.ajax(`/items/${this.props.item.id}`,{
      method: "put",
      dataType: "json",
      contentType: "application/json",
      data: JSON.stringify({'cart_item':{ quantity: this.state.item.quantity, product_id: this.props.item.product_id} , authenticity_token: document.querySelector("meta[name=csrf-token]").content}),
      success: (data) =>{ console.warn(data) }
    });
  }


  render(){
      return (
       <tr key={this.state.item.id}>
        <td>
          <a href={`/products/${this.state.item.product.permalink}`} >
            <img className="thumbnail" src={this.state.item.product.cover_image.cover.url} />
          </a>
        </td>
        <td>
          <a href={`/products/${this.state.item.product.permalink}`} >{this.state.item.product.title} </a>
        </td>
        <td>
          <input type="number" value={this.state.item.quantity} name="item.quantity" onChange={this.change.bind(this) } />
        </td>
        <td>
          {this.state.item.product.price}
        </td>
        <td>
          {this.state.item.product.price * this.state.item.quantity}
        </td>
        <td>
          <button className="fa fa-trash" value={this.state.item.product.id} onClick={this.submit.bind(this)}/>
        </td>
      </tr>
    )
  }

}

