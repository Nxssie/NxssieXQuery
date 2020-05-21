module namespace page = 'http://nxssie.com';

(:DELETE:)
declare
  %rest:POST
  %rest:path('/nxssie/deletesong')
  %rest:form-param("songname","{$songname}","(nosongname)")
  %rest:form-param("artistname","{$artistname}","(noartistname)")
  %rest:form-param("genre","{$genre}","(nogenre)")
  %rest:form-param("albumname","{$albumname}","(noalbumname)")
  %rest:form-param("datereleased","{$datereleased}","(nodatereleased)")
  %rest:form-param("spotifyurl","{$spotifyurl}","(nospotifyurl)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
updating function page:insertSong(
  $songname as xs:string,
  $artistname as xs:string,
  $genre as xs:string,
  $albumname as xs:string,
  $datereleased as xs:string,
  $spotifyurl as xs:string
) {
  update:output(web:redirect('/nxssie')),
  for $song in doc("songs")/songs/song
  where $songname = $song/name
  return delete node $song
};