<?php
require_once 'vendor/autoload.php';

use GuzzleHttp\Client;
$client = new Client();

$response = $client->request('GET', 'http://www.omdbapi.com', [
	'query' => [
		'apikey' => '8edcc915',
		's' => 'Transformers'
	]
]);

$result = json_decode($response->getBody()->getContents(), true);
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Guzzle Movie</title>
</head>
<body>
	<?php foreach($result['Search'] as $val) : ?>
		<ul>
			<li>Title : <?= $val['Title']; ?></li>
			<li>Year : <?= $val['Year']; ?></li>
			<li><img src="<?= $val['Poster']; ?>" width="100px"></li>
		</ul>
	<?php endforeach; ?>
</body>
</html>