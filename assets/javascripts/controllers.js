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

  $scope.posts = [];
  $scope.newPosts = [];

  $http.get('/channels/' + channel.slug + '.json').
    success(function(data, status, headers, config) {
      $scope.posts = data;
    }).
    error(function(data, status, headers, config) {
      console.log('Error loading initial posts');
    });

  $scope.update = function() {
    $scope.posts = $scope.newPosts.concat($scope.posts);
    $scope.newPosts = [];
  }

  $scope.post = function() {
    if ($scope.postBody && $scope.postBody.trim() !== ''){
      $.ajax({
        type: "post",
        url: "/channels/" + channel.slug,
        data: {
          body: $scope.postBody.trim()
        }
      });
      $scope.postBody = ''
    }
  }

  var es = new EventSource('/channels/' + channel.slug + '/stream');
  es.onmessage = function(e) {
    $scope.$apply(function () {
      $scope.newPosts = JSON.parse(e.data).concat($scope.newPosts);
    });
  }

});