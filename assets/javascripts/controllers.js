var broadcastorApp = angular.module('broadcastorApp', ['angularMoment'])
.filter('timeAgo', function() {
  return function(unixDate) {
    return moment(unixDate * 1000).fromNow();
  }
});

broadcastorApp.controller('ChannelCtrl', function ($scope, $http) {

  $http.get('/channels/' + channel.slug + '.json').
    success(function(data, status, headers, config) {
      $scope.posts = data;
    }).
    error(function(data, status, headers, config) {
      console.log('Error loading initial posts');
    });

  $scope.newPosts = [];

  $scope.peek = function () {
    var timestamp = $scope.posts.length > 0 ? $scope.posts[0].timestamp : 0;
    $http.get('/channels/' + channel.slug + '/after/' + timestamp + '.json')
      .success(function(data, status, headers, config) {
        if (data) $scope.newPosts = data.concat($scope.newPosts);
      })
      .error(function(data, status, headers, config) {
        console.log('Error updating posts');
      });
  };

  $scope.update = function() {
    $scope.posts = $scope.newPosts.concat($scope.posts);
    $scope.newPosts = [];
  }

});