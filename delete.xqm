module namespace page = 'http://nxssie.com';

(:DELETE:)
declare
  %rest:POST
  %rest:path('/nxssie/deletesong')
  %rest:form-param("songname","{$songname}","(nosongname)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
updating function page:deleteSong(
  $songname as xs:string
) {
  update:output(web:redirect('/nxssie')),
  for $song in doc("songs")/songs/song
  where $songname = $song/name
  return delete node $song
};