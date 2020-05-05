// app/assets/javascripts/channels/messages.js

App.messages = App.cable.subscriptions.create('DatasChannel', {
  received: function(data) {
    
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return `<ul>
              <li>${data.name}</li>
              <li>${data.city}</li>
              <li>${data.zip_code}</li>
              <li>${data.street}</li>
            </ul>`;
  }
});
