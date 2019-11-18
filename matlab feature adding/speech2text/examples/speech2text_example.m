%% Perform Speech-to-Text using 3rd party Speech APIs
%
% This example shows how to perform speech-to-text transcription in
% MATLAB(R). The |speech2text| function enables you to interface with 3rd
% party speech APIs.

%   Copyright 2017-2019 The MathWorks, Inc.

%% Introduction
% The |speech2text| function provides the ability to use 3rd party speech 
% APIs to perform speech-to-text transcription. The function supports the 
% following 3rd party tools:
%
% # <https://cloud.google.com/speech-to-text/ Google(TM) Cloud Speech-to-Text API>
% # <https://www.ibm.com/watson/services/speech-to-text/ IBM(TM) Watson
% Speech to Text API>
% # <https://azure.microsoft.com/en-us/services/cognitive-services/speech-to-text/
% Microsoft(TM) Azure Speech Services API>
%
% To use the |speech2text| function, you must have the following products 
% installed:
% 
% * MATLAB release R2017a and above
% * Audio System Toolbox(TM)
% 

%% Set up 3rd Party API
% Before you start using the |speech2text| function, you need to perform
% some steps to set up the API. This involves creating an account with the
% cloud service and generating an authorization key.
%
% Google, IBM and Microsoft APIs have different requirements to set up an 
% account and generate an authorization key.
%
%%
%
% <html><h3>Google Cloud Speech-to-Text</h3></html>
% 
% Using the Google Cloud Speech-to-Text API requires an API key for
% authorizing the request. The following steps describe how to create the
% API key.  This is also described in the
% <https://cloud.google.com/docs/authentication/api-keys Google
% documentation>:
%
% 1. Navigate to the <https://console.cloud.google.com/apis/credentials
% APIs & Services->Credentials> panel in Cloud Platform Console.
%
% 2. Select *Create credentials*, then select *API key* from the dropdown
% menu.
% 
% <<Google_Create_Key.png>>
%
% 3. Click the *Create* button. A dialog box appears which displays your
% newly created key.
%
% 4. Once you have the API key, download it and create a JSON file such
% that:
%
% a. JSON file should have only one attribute: "key" (case sensitive). For
% example, if the API key generated is ABCDefgh, then the file will have
% the attribute "key", and value "ABCDefgh", as shown below:
%
% <<writing_Google_JSON.png>>
%   
% b. Save the file as "Google_Credentials_Speech2text.json" to a *secure*
% location.
% 
% The |speech2text| function will look for
% "Google_Credentials_Speech2text.json" to obtain the API key, which the
% Google Speech API requires for authentication.
%
%%
%
% <html><h3>IBM Watson Speech to Text</h3></html>
%
% IBM Speech to Text API is offered through IBM Cloud services which now
% uses token-based Identity and Access Management (IAM) authentication. To
% begin, you must create an IBM Cloud account, a Speech to Text service
% instance, and go to the service dashboard and copy your credentials - API
% Key and URL values.
% 
% This information is also described in the 
% <https://console.bluemix.net/docs/services/speech-to-text/getting-started.html#gettingStarted
% IBM Speech to Text documentation>:
%
% 1.  Go to the <https://console.bluemix.net/catalog/services/speech-to-text/ Speech to Text service> 
% and sign up for a free IBM Cloud account or log in to your existing account.
%
% 2. After you log in, enter speech-to-text-tutorial in the Service name
% field of the Speech to Text page. Click *Create*.
%
% 3. Copy the credentials created:
%
% a. Go to the <https://console.bluemix.net/dashboard/apps IBM Cloud dashboard>
%   
% b. Select the Speech to Text service instance.
%   
% c. Click *Show Credentials" under *Manage*.
%
% d. Copy the API Key and URL values.
%
% 4. Write the API Key and URL values to a JSON file:
%
% a. For example, if the API Key generated is "abcd-1234-WXYZ" and the URL
% is "https://stream.watsonplatform.net/speech-to-text/api" then the JSON
% file will have the attribute "apikey" with value "abcd-1234-WXYZ" and
% "url" with value "https://stream.watsonplatform.net/speech-to-text/api",
% as shown below:
%
% <<writing_IBM_JSON.png>>
%
% b.  Save the file as "IBM_Credentials_Speech2text.json" to a *secure*
% location.
%
% The |speech2text| function will look for
% "IBM_Credentials_Speech2text.json" to obtain the API Key and URL.
%
%%
%
% <html><h3> Microsoft Azure Speech API </h3></html>
%
% Microsoft's Speech to Text API is part of Microsoft Azure Speech
% Services, and requires subscription keys. You can obtain the keys from
% the Cognitive Services subscription page by following the steps below.
% This infromation is also described in
% <https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/get-started
% Microsoft Speech Service Documentation>:
% 
% 1. Go to the Cognitive Services subscription, and login/create your
% Microsoft Azure account.
%
% 2. Select Speech Services and click on *Get API Key*.
% 
% 3. This returns a primary and secondary key  "Key 1" and "Key 2". Select
% your location/country and get the endpoint URI. Copy these to create a JSON
% file:
%
% a. JSON file should have four attributes: "key1", "key2", "tokenUri" and
% "requestUri" (case sensitive). The URIs can also be obtained from
% <https://docs.microsoft.com/en-us/azure/cognitive-services/Speech-Service/rest-apis
% Speech Service REST APIs documentation>. For example, if the Key 1
% generated is abcd1235 and Key 2 is 5678wxyz then the JSON file will have
% the attribute "key1" with value "abcd1235" and "key2" with value
% "5678wxyz" and the URIs as shown below:
%
% <<writing_Microsoft_JSON.png>>
%
% b. Save the file as "Microsoft_Credentials_Speech2text.json" to a
% *secure* location.
% 
% The |speech2text| function will look for
% "Microsoft_Credentials_Speech2text.json" to obtain the subscription key.
%
% If the JSON file is not on MATLAB search path, the |speech2text| function
% will prompt you to provide the path. This path is then saved to MATLAB
% search path.
%
%% Create speechClient
%
% After getting the authorization credentials from the respective API, you 
% are ready to perform speech to text transcription. The first step is to 
% set up a |speechClient| object with the speech API and its properties.
% 
% This example uses the Google Speech API, and specifies the |languageCode|
% option to 'en-US':
speechObject = speechClient('Google','languageCode','en-US')

%%
%
% <html><h3> Input Parameters </h3></html>
%
% Since each of the APIs support varied number of input parameters and the
% parameters have different names, you are expected to provide the correct
% input for the API. If the API returns any error due to incorrect input
% parameters, then the |speech2text| function captures and reports the
% error.
%
% <html><h3> Using Google </h3></html>
%
% The name-value pairs provided with the |speechClient| object should
% adhere to the name-value pair that the Google Cloud Speech-to-Text API
% accepts, as described in their
% <https://cloud.google.com/speech/reference/rest/v1/RecognitionConfig
% documentation>.
%
% <html><h3> Using IBM </h3></html>
%
% For the IBM Speech to Text API, the name-value pairs provided to the
% |speechClient| object should adhere to the name-value pair that the IBM
% API accepts, as described in their
% <https://www.ibm.com/watson/developercloud/speech-to-text/api/v1/#recognize_sessions_nonmp18
% documentation>. For example, to specify the keywords to IBM, you also
% need to specify the threshold value:
speechObjectIBM = speechClient('IBM','keywords',"example,keywords",'keywords_threshold',0.5);
speechObjectIBM.Options

%%
%
% <html><h3> Using Microsoft </h3></html>
%
% For Microsoft Speech to Text API the name-value pairs provided with the
% |speechClient| object should adhere to the name-value pair as described
% in their
% <https://docs.microsoft.com/en-us/azure/cognitive-services/Speech-Service/rest-apis#query-parameters
% documentation>.
%
% If no parameter names and values are specified, then the API uses default
% values. Refer to the respective APIs documentation for more information
% on default values.
% 
%% Perform Speech-to-Text Transcription 
%
% Read a speech signal, and get the speech samples (|y|) and sampling
% frequency (|fs|). This example uses a speech signal which counts numbers
% from 1 to 10 in English.
[y,fs] = audioread('Counting-16-44p1-mono-15secs.wav');

%%
% Call the |speech2text| function and pass the |speechClient| object
% with |y| and |fs|
tableOut = speech2text(speechObject,y,fs)

%%
% Call the |speech2text| function and pass the |speechClient| object
% with |y|, |fs|, and |HTTPTimeOut|
tableOut = speech2text(speechObject,y,fs,'HTTPTimeOut',25)

%%
%
% <html><h3>Output Format</h3></html>
%
% The output is returned as a table with Transcript and Confidence values.
% If there were any errors, then the output provides the error code and
% the error message.
%
% If you configured the |speechClient| to return additional results, then
% the output of |speech2text| returns the additional results as part of the
% output table. For example, if you had set the maximum alternatives
% parameter to 3 and if there are 3 alternatives returned by the Google API
% then the output will have three columns: |TRANSCRIPT|, |CONFIDENCE| and
% |ALTERNATIVES|. The |ALTERNATIVES| will be another table that contains
% the |TRANSCRIPT| and |CONFIDENCE| of the alternate transcription of the
% speech signal
speechObject = speechClient('Google','languageCode','en-US','maxAlternatives',3);
tableOut = speech2text(speechObject,y,fs)

%% Billing Details
% MathWorks provides the |speech2text| function free of charge. However,
% the 3rd party speech APIs are not free. Consult the individual API
% documentation for pricing details:
%
% * <https://cloud.google.com/speech/pricing Google Cloud Speech Pricing>
% * <https://console.bluemix.net/docs/services/speech-to-text/faq-pricing.html#pricing IBM Watson Speech to Text Pricing>
% * <https://azure.microsoft.com/en-us/pricing/details/cognitive-services/speech-services Microsoft Azure Speech Services Pricing>
%