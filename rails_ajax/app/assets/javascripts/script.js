RailsAjax = {}

RailsAjax.fields = ["title", "description", "author", "twitter", "published_at"];

RailsAjax.request = function(method, url, data){
  return $.ajax({
    type: method,
    url: url,
    dataType: "json",
    data: data
  })
}

RailsAjax.togglePages = function(id1, callback){
  //id1 is the div that we want to show
  // therefore id2 will be the div we want to hide 
  var id2 = (id1=="#new_post" ? "#all_posts" : "#new_post") 
  $(id2).slideUp(function(){
      // callback function, will only begin when the slideUp
      // animation above is 100% finished
      $(id1).slideDown(function(){
        if(callback != undefined) callback()
      });
    });
}

RailsAjax.initialize = function(){

  $("#all_posts_link, #new_post_link").on("click", function(){
    event.preventDefault();
    var show_page = $(this).attr("id").replace("_link", "")
    if (show_page == "new_post") $("form").trigger("reset")
    RailsAjax.togglePages("#"+ show_page)
  });
  
  RailsAjax.getPosts();
  $('#post_form').on('submit',RailsAjax.postForm);
  $('table').on('click', '.delete-post', RailsAjax.deletePost);
    $('table').on('click', '.edit-post', RailsAjax.editPost);
  }


RailsAjax.postForm = function(){
  event.preventDefault();
  var id = $("form #id").val();
  if(id != ""){ //means the form is updating an existing post
    var path = "/posts/"+ id;
    var method = "PUT";
  }else{//means the form created a new post
    var path = "/posts";
    var method = "POST";
  }
 
  var data = {};
  $.each(RailsAjax.fields, function(i, field){
    data[field] = $("#"+field).val();
  })

  RailsAjax.request(method, path, {post: data}).done(function(data){
    if(id != ""){
      RailsAjax.getPosts()
    } else{ 
      RailsAjax.appendRow(data)
    }

    RailsAjax.togglePages("#all_posts", function(){
      $("form").trigger("reset")
    })
  })
}

RailsAjax.editPost = function(){
  id = $(this).data("id");
  RailsAjax.request("GET", "/posts/"+id).done(function(data){
    $.each(RailsAjax.fields.concat(["id"]), function(i, field){
      $("input[name='"+field+"']").val(data[field])
    })

    RailsAjax.togglePages("#new_post")
  })
}

RailsAjax.deletePost = function(){
  event.preventDefault();
  $this = $(this);
  var postId = $this.data("id");
  var path = "/posts/"+ postId.toString();
  RailsAjax.request("DELETE", path).done(function(){
    $this.closest("tr").remove();
  })
}

RailsAjax.appendRow = function(item){
  var row = $("<tr>" +
          "<td>"+ item.title +"</td>" +
          "<td>"+ item.description +"</td>" +
          "<td>"+ item.author +"</td>" +
          "<td><a href='http://www.twitter.com/"+ item.twitter +"' target='_blank'>@"+ item.twitter +"</a></td>" +
          "<td>"+ item.published_at +"</td>" +
          "<td><button data-id='"+item.id+"' class='btn btn-danger delete-post'>Delete</button><button data-id='"+item.id+"' class='btn edit-post'>Edit</button></td>" +
        "</tr>");
  row.appendTo('#all_posts table tbody');
}

RailsAjax.getPosts = function(){
  $.getJSON("/posts", function(data){
    $("#all_posts table tbody").html("")
    $.each(data, function(i, item){
      RailsAjax.appendRow(item)
    })
  })
}



// $(function(){}) is an alias for $(document).ready(function(){})
$(RailsAjax.initialize)