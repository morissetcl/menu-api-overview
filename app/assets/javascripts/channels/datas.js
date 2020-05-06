// app/assets/javascripts/channels/messages.js

App.messages = App.cable.subscriptions.create('DatasChannel', {
  received: function(data) {
    switch (data.type) {
      case 'restaurant':
        $('#restaurants-table tr:first').after(this.renderMessageRestaurant(data));
        $('#restaurants-table tr:last').remove();
        break;
      case 'dish':
        $('#dish-table tbody tr:first').before(this.renderMessageDish(data));
        $('#dish-table tr:last').remove();
        break;
      case 'accounting':
        return $('#messages').append(this.renderMessageAccounting(data));
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
              <td>$${this.parseData(data.price)}</td>
              <td>${this.parseData(data.description)}</td>
            </tr>`;
  },

  renderMessageAccounting: function(data) {
    return `<ul>
              <li>${this.parseData(data.name)}</li>
              <li>$${this.parseData(data.price)}</li>
              <li>${this.parseData(data.description)}</li>
            </ul>`;
  },

  parseData: function(data) {
    if (data == undefined) {
      return '-'
    } else {
      return data
    }
  }
});
