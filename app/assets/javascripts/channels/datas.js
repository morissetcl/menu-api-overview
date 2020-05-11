// app/assets/javascripts/channels/messages.js

App.messages = App.cable.subscriptions.create('DatasChannel', {
  received: function(data) {
    switch (data.type) {
      case 'restaurant':
        $('#restaurants-table tr:last').remove();
        $('#restaurants-table tr:first').after(this.renderMessageRestaurant(data));
        break;
      case 'dish':
        $('#dish-table tr:last').remove();
        $('#dish-table tbody tr:first').before(this.renderMessageDish(data));
        break;
      case 'accounting':
        $('#dish_count').text(data.dish_count);
        $('#restaurant_count').text(data.restaurant_count);
        break;
      default:
        console.log('Sounds like there no data type defined.');
    }
  },

  renderMessageRestaurant: function(data) {
    return `<tr>
              <td>${this.parseData(data.name)}</td>
              <td>${this.parseData(data.street).capitalize}</td>
              <td>${this.parseData(data.city)}</td>
              <td>${this.parseData(data.zip_code)}</td>
            </tr>`;
  },

  renderMessageDish: function(data) {
    console.log(data)
    return `<tr>
              <td>${this.parseData(data.name)}</td>
              <td>${this.parseData(data.price)}</td>
              <td>${this.parseData(data.description)}</td>
            </tr>`;
  },

  parseData: function(data) {
    if (data == undefined) {
      return '-'
    } else {
      return data
    }
  }
});
