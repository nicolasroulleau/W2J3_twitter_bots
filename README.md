LE TWITTER 	BOT RETWEET LE DERNIER TWEET DE CHAQUE JOURNALISTE DE LA LISTE TOUTES LES 10 SECONDES

1. Exécuter le fichier twitter_bot.rb dans le terminal (saisir ruby twitter_bot.rb)

2. Le programme s'exécute

3. Terminer le programme et revenir à la console en tapant Ctrl + C

CODE TWITTER BOT
# retweet le dernier tweet de chaque twittos de l'array
reporters.each do |reporter|
	id = client.user(reporter)
	timeline = client.user_timeline(id)
	last_tweet = timeline[0]
	client.retweet(last_tweet)
	sleep(10)
end