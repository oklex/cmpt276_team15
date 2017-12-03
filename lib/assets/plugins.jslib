mergeInto(LibraryManager.library, {

  Hello: function () {
    window.alert("Hello, world!");
  },
  
  Calc_accuracy: function (projctiles_hit, projectiles_total) {
    return projctiles_hit / projectiles_total;
  },

});
