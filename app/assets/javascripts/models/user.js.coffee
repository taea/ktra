class Ktra.Models.User extends Backbone.Model
  urlRoot: '/account'
  parse: (res) -> res.user
