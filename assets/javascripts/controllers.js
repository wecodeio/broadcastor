var broadcastorApp = angular.module('broadcastorApp', ['angularMoment'])
.filter('timeAgo', function() {
  return function(unixDate) {
    return moment(unixDate * 1000).fromNow();
  }
})
.filter('pluralize', function() {
  return function(length) {
    return length > 1 ? 's' : '';
  }
});

broadcastorApp.controller('ChannelCtrl', function ($scope, $http) {

  var interval = 5000;

  $scope.posts = []
  $scope.newPosts = [];

  $http.get('/channels/' + channel.slug + '.json').
    success(function(data, status, headers, config) {
      $scope.posts = data;
    }).
    error(function(data, status, headers, config) {
      console.log('Error loading initial posts');
    });

  $scope.peek = function () {
    var timestamp = $scope.newPosts.length > 0 ? $scope.newPosts[0].timestamp :
      $scope.posts.length > 0 ? $scope.posts[0].timestamp : 0;
    $http.get('/channels/' + channel.slug + '/after/' + timestamp + '.json')
      .success(function(data, status, headers, config) {
        interval = 5000;
        if (data) $scope.newPosts = data.concat($scope.newPosts);
      })
      .error(function(data, status, headers, config) {
        interval = interval * 2;
        console.log('Error updating posts');
      });

    window.setTimeout($scope.peek, interval);
  };

  $scope.update = function() {
    $scope.posts = $scope.newPosts.concat($scope.posts);
    $scope.newPosts = [];
  }

  window.setTimeout($scope.peek, interval);

});