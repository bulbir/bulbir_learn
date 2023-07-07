$('#search-button').click(search);

$('#search-input').keypress(function (e) {
  if (e.which == 13) {
  	search();
    return false;    //<---- Add this line
  }
});

function search() {
	$('#movie-list').html('');

	$.ajax({
		url: 'http://www.omdbapi.com',
		type: 'get',
		dataType: 'json',
		data: {
			'apikey': '8edcc915',
			's': $('#search-input').val()
		},
		success: function(result) {
			if(result.Response == 'True') {
				let movies = result.Search;

				$.each(movies, function(i, data) {
					$('#movie-list').append(`
						<div class="col-md-4">
							<div class="card mb-3">
							  <img src="` + data.Poster + `" class="card-img-top" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">` + data.Title + `</h5>
							    <h6 class="card-subtitle mb-2 text-muted">` + data.Year + `</h6>
							    <a href="#" data-id="` + data.imdbID + `" class="card-link see-detail" data-toggle="modal" data-target="#exampleModal">See Detail</a>
							  </div>
							</div>
						</div>
					`);
				});
			} else {
				$('#movie-list').html(`
					<div class="col"><h3 class="text-center">` + result.Error + `</h3></div>
				`);
			}
		}
	});

	$('#search-input').val('');
}

$('#movie-list').on('click', '.see-detail', function() {
	$.ajax({
		url: 'http://www.omdbapi.com',
		type: 'get',
		dataType: 'json',
		data: {
			'apikey': '8edcc915',
			'i': $(this).data('id')
		},
		success: function(movie) {
			if(movie.Response == 'True') {
				$('.modal-body').html(`
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-4">
								<img src="` + movie.Poster + `" class="img-fluid">
							</div>
							<div class="col-sm-8">
							<ul class="list-group">
							  <li class="list-group-item"><h3>` + movie.Title + `</h3></li>
							  <li class="list-group-item">Released : ` + movie.Released + `</li>
							  <li class="list-group-item">Genre : ` + movie.Genre + `</li>
							  <li class="list-group-item">Director : ` + movie.Director + `</li>
							  <li class="list-group-item">Actors : ` + movie.Actors + `</li>
							</ul>
							</div>
						</div>
					</div>
				`);
			}
		}
	});
});
