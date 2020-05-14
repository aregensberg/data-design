/*insert*/
INSERT INTO profile (profileId, profileActivationToken, profileEmail, profileHash, profileImage)
VALUES (UNHEX("aae93a33773c4baf9fde95eb657cdd80"), "shopshoppingshop", "email@gmail.com", "pw12345", "pictureOfMe");

INSERT INTO profile (profileId, profileActivationToken, profileEmail, profileHash, profileImage)
VALUES (UNHEX("85f109c512674f979a22c3350cd49f28"), "thisIsMyPw", "GoGo@gmail.com", "lookAPassword", "OOTD");

INSERT INTO profile (profileId, profileActivationToken, profileEmail, profileHash, profileImage)
VALUES (UNHEX("ebb58fa98efd4431bec6c2279fe33f13"), "passPassWord", "Shopper@Yahoo.com", "notTheSamePw", "letsTakeASelfie");

/* foreign Keys insert*/
INSERT INTO story(storyId, storyProfileId, storyContent, storyDate)
VALUES (UNHEX("92ca17f04945485bbaa48b0056e2f542"), UNHEX("aae93a33773c4baf9fde95eb657cdd80"), "www.myinstashop.com/ootd-summer", "2020-04-15");

INSERT INTO story(storyId, storyProfileId, storyContent, storyDate)
VALUES(UNHEX("6c2a1b9e4e584d2581afd48c05a0132a"), UNHEX("85f109c512674f979a22c3350cd49f28"), "www.shoptilyoudrop.com/summer-20", "2020-05-05");

/*update
UPDATE table SET colunm1 = newValue1, WHERE primaryKey = uuid; */
UPDATE profile SET profileEmail = "iloveclothes@gmail.com" WHERE profileId = UNHEX("ebb58fa98efd4431bec6c2279fe33f13");

/*delete
DELETE FROM table WHERE primayKey = uuid; */
DELETE FROM profile WHERE primaryKey = UNHEX ("85f109c512674f979a22c3350cd49f28");


/*select
 SELECT tweetId, tweetProfileId, tweetContent, tweetDate from tweet WHERE tweetProfileId = UNHEX("2435f00e555d455d92fdf34f1dd255e2"); */
SELECT profileId, profileActivationToken, profileEmail, profileHash, profileImage FROM profile WHERE profileId = UNHEX("aae93a33773c4baf9fde95eb657cdd80");


/* select-inner join
 SELECT tweet.tweetId, tweet.tweetProfileId, tweet.tweetContent, tweet.tweetDate FROM tweet INNER JOIN profile on tweet.tweetProfileId = profile.profileId where tweet.tweetContent = "California"*/
SELECT profile.profileId, profile.profileEmail, profile.profileImage, story.storyDate FROM profile INNER JOIN story on profile.profileId = story.storyProfileId WHERE profile.profileEmail = "GoGo@gmail.com";

/* DDC Example*/
Write a select statement based off of DDC-Twitter that counts the number of likes for a specific tweet.
SELECT likeProfileId, likeTweetId, likeDate FROM like Where tweetId = UNHEX('')