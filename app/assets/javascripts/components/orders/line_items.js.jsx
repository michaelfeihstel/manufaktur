/** @jsx React.DOM */

var LineItemSection = React.createClass({
  getInitialState: function() {
    return {lineitems: []};
  },

  componentDidMount: function() {
    this.getLineItems();
  },

  getLineItems: function() {
    $.ajax({
      url: "/api/orders/15618/line_items",
      dataType: "json",
      success: function(lineitems) {
        this.setState({lineitems: lineitems});
      }.bind(this),
      error: function(xhr, status, error) {
        console.error(status, err.toString());
      }.bind(this)
    });
  },

  render: function() {
    return (
      <div className="LineItemSection">
        <LineItemList lineitems={this.state.lineitems} />
      </div>
    );
  }
});

var LineItemList = React.createClass({
  render: function() {
    var lineitemNodes = this.props.lineitems.map(function(lineitem, index) {
      return (
        <LineItem 
          key={lineitem.id}
          lineitem={lineitem}
        />
      )
    });

    return (
      <div className="lineItemList">
        {lineitemNodes}
      </div>
    )
  }
});

var LineItem = React.createClass({
  render: function() {
    return (
      <div className="line-item">
        <p>{this.props.lineitem.product.sku}</p>
      </div>
    );
  }
});