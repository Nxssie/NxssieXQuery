module namespace page = 'http://nxssie.com';

(:READ:)
declare
  %rest:POST
  %rest:path('/nxssie/searchsong')
  %rest:form-param("songname","{$songname}","(nosongname)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:mysongs(
  $songname as xs:string
) as element(html) {
  <html>
    <head>
      <title>Nxssie</title>
      <!-- Font Awesome -->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" />
      <!-- Google Fonts -->
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
      <!-- Bootstrap core CSS -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" />
      <!-- Material Design Bootstrap -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet" />
      <!-- Datatables CSS -->
      <link href="../static/css/addons/datatables2.min.css" rel="stylesheet" />
      <!--<link href="" rel="stylesheet" />-->
      <link href="../static/css/styles.css" rel="stylesheet" />

      <!-- Favicon -->
          <link rel="apple-touch-icon" sizes="57x57" href="../static/img/favicon/apple-icon-57x57.png"/>
          <link rel="apple-touch-icon" sizes="60x60" href="../static/img/favicon/apple-icon-60x60.png"/>
          <link rel="apple-touch-icon" sizes="72x72" href="../static/img/favicon/apple-icon-72x72.png"/>
          <link rel="apple-touch-icon" sizes="76x76" href="../static/img/favicon/apple-icon-76x76.png"/>
          <link rel="apple-touch-icon" sizes="114x114" href="../static/img/favicon/apple-icon-114x114.png"/>
          <link rel="apple-touch-icon" sizes="120x120" href="../static/img/favicon/apple-icon-120x120.png"/>
          <link rel="apple-touch-icon" sizes="144x144" href="../static/img/favicon/apple-icon-144x144.png"/>
          <link rel="apple-touch-icon" sizes="152x152" href="../static/img/favicon/apple-icon-152x152.png"/>
          <link rel="apple-touch-icon" sizes="180x180" href="../static/img/favicon/apple-icon-180x180.png"/>
          <link rel="icon" type="image/png" sizes="192x192" href="../static/img/favicon/android-icon-192x192.png"/>
          <link rel="icon" type="image/png" sizes="32x32" href="../static/img/favicon/favicon-32x32.png"/>
          <link rel="icon" type="image/png" sizes="96x96" href="../static/img/favicon/favicon-96x96.png"/>
          <link rel="icon" type="image/png" sizes="16x16" href="../static/img/favicon/favicon-16x16.png"/>
          <link rel="manifest" href="../static/img/favicon/manifest.json"/>
          <meta name="msapplication-TileColor" content="#ffffff"/>
          <meta name="msapplication-TileImage" content="../static/img/favicon/ms-icon-144x144.png"/>
          <meta name="theme-color" content="#ffffff"/>

    </head>
    <body>
      <div id="jumbo"> <!-- Here goes the jumbotron --> </div>
      <div class="row">
        <div class="container">
            <table id="songs-table" class="table" cellspacing="0" width="100%" >
              <thead>
                <tr>
                  <th class="th-sm">Song name</th>
                  <th class="th-sm">Album</th>
                  <th class="th-sm">Artist</th>
                  <th class="th-sm">Genre</th>
                  <th class="th-sm">Released</th>
                </tr>
              </thead>
                {
                        for $song in doc("songs")/songs/song
                        where $song/name = $songname
                        order by $song/name
                        return
                              <tbody>
                                 <tr>
                                      <td id="td-name"> {$song/name/text()} </td>
                                      <td id="td-album"> {$song/album/text()} </td>
                                      <td id="td-artist"> {$song/artist/text()} </td>
                                      <td id="td-genre"> {$song/genre/text()} </td>
                                      <td id="td-released"> {$song/released/text()} </td>
                                      <td id="td-url"><a class="btn aqua-gradient" href="{$song/url/text()}"><i class="fab fa-spotify left"></i>Listen {$song/name/text()} on Spotify</a></td>
                                 </tr>
                              </tbody>
                }
            </table>
        </div>
      </div>
      <div class="row">
        <div class="container" id="buttons-read-page">
          <form action="/nxssie">
            <button type="submit" class="btn peach-gradient" id="return-button"><i class="fas fa-home mr-2"></i>Return home</button>
          </form>
          <div class="dropdown" id="insert-container">
            <a class="btn btn-outline-secondary waves-effect dropdown-toggle" href="#" role="button" id="update-button"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-edit mr-2"></i>Edit
            </a>
            <div class="dropdown-menu">
            {
              for $song in doc("songs")/songs/song
              where $song/name = $songname
              order by $song/name
              return
                <form action="/nxssie/updatesong" method="POST" id="update-form">
                  <div class="form-row">
                      <div class="col">
                          <!-- Song name -->
                          <div class="md-form">
                            <input type="text" name="songname" class="form-control" value="{$song/name/text()}" />
                            <label for="song-name">Song name</label>
                          </div>
                      </div>
                      <div class="col">
                          <!-- Album name -->
                          <div class="md-form">
                            <input type="text" name="albumname" class="form-control" value="{$song/album/text()}"/>
                            <label for="albumname">Album</label>
                          </div>
                      </div>
                  </div>
                  <div class="form-row">
                      <div class="col">
                          <!-- Artist name -->
                          <div class="md-form">
                            <input type="text" name="artistname" class="form-control" value="{$song/artist/text()}"/>
                            <label for="artistname">Artist</label>
                          </div>
                      </div>
                      <div class="col">
                          <!-- Genre -->
                          <div class="md-form">
                            <input type="text" name="genre" class="form-control" value="{$song/genre/text()}"/>
                            <label for="genre">Genre</label>
                          </div>
                      </div>
                  </div>
                  <div class="form-row">
                      <div class="col">
                          <!-- Date released -->
                          <div class="md-form">
                            <input type="text" name="datereleased" class="form-control" value="{$song/released/text()}"/>
                            <label for="datereleased">Release Date</label>
                          </div>
                      </div>
                      <div class="col">
                          <!-- Spotify URL -->
                          <div class="md-form">
                            <input type="text" name="spotifyurl" class="form-control" value="{$song/url/text()}"/>
                            <label for="spotifyurl">Spotify URL</label>
                          </div>
                      </div>
                  </div>
                  <div class="form-row" id="update-button-div">
                    <div class="col">
                      <div class="md-form">
                        <button type="submit" class="btn btn-primary">Update</button>
                      </div>
                    </div>
                  </div>
                </form>
              }
            </div>
          </div>
        </div>
      </div>
      <!-- Optional JS -->
      <!--<script type="text/javascript" src="" /> -->
      <script type="module" src="../static/js/loader.js"></script>
      <!-- JQuery -->
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <!-- Bootstrap tooltips -->
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
      <!-- Bootstrap core JavaScript -->
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>
      <!-- MDB core JavaScript -->
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/js/mdb.min.js"></script>
      <!-- Datatables JS -->
      <script type="text/javascript" src="../static/js/addons/datatables2.min.js"></script>
    </body>
  </html>
};