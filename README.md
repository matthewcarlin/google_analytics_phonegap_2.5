google_analytics_phonegap_2.5
=============================

Google Analytics Plugin for Cordova/Phonegap 2.5+


Instructions

Make sure you are running Cordova(PhoneGap) 2.5.0

Drag and drop the GoogleAnalytics folder from Finder to your Plugins folder in XCode, using "Create groups for any added folders"

Include the CFNetwork framework in your project and link against libsqlite3.0.dylib.

Add the .js files to your www folder on disk, and add reference(s) to the .js files as tags in your html file(s)

Add new entry <plugin name="googleAnalyticsPlugin" value="GoogleAnalyticsPlugin" /> to config.xml

Add google-analytics.com string to ExternalHosts array in project_name_.plist 



Initialise the tracker with the following code with the following code:

cordova.exec(null, null, "GoogleAnalyticsPlugin", "trackerWithTrackingId",["UA-0000000-00"]);


and track views using the following code (replacing /loadready with your page or view you want to track)
	cordova.exec(null, null, "GoogleAnalyticsPlugin", "trackView",["/loadready"]);
	
	You may be able to track events with the following (not 1oo% sure this works at the moment)
	
cordova.exec(null, null, "GoogleAnalyticsPlugin", "trackEvent", [ "category", "action", "label goes here", 666 ]);


When you set up your profile in google analytics, choose the app type instead of website.
	
