echo "...[REMOVING-OLD-SDK-VERSION]"

if [ -d "../infra_sdk" ]; then
    echo "...[REMOVING-OLD-SDK-VERSION]"
    rm -rf ../infra_sdk
    echo "...[REMOVED-OLD-SDK-VERSION]"
else
    echo "...[NO-EXISTING-SDK-TO-REMOVE]"
fi

echo "...[REMOVED-OLD-SDK-VERSION]"



echo "...[CREATING-DIRECTORY-FOR-SDK]"
echo " "

mkdir ../infra_sdk

cd ../infra_sdk 

mkdir auth account engagement period-tracker

# cd ../

echo " "
echo "...[CREATED-DIRECTORY-FOR-SDK]"



echo "...[GENERATE-SDKS-PROCESSING]"
echo " "

echo "...[GENERATE-AUTH-SDK-PROCESSING]"
echo " "
openapi-generator generate -i https://www.venille-api.livestocx.xyz/docs/auth-service-json -g dart-dio -o ../infra_sdk/auth --enable-post-process-file --additional-properties=pubName=auth_sdk,pubLibrary=auth_api.api

echo " "
echo "...[GENERATE-AUTH-SDK-SUCCESS]"
echo " "

echo "...[GENERATE-ACCOUNT-SDK-PROCESSING]"
echo " "
openapi-generator generate -i https://www.venille-api.livestocx.xyz/docs/account-service-json -g dart-dio -o ../infra_sdk/account --enable-post-process-file --additional-properties=pubName=account_sdk,pubLibrary=account_api.api

echo " "
echo "...[GENERATE-ACCOUNT-SDK-SUCCESS]"
echo " "


echo " "
echo "...[GENERATE-ENGAGEMENT-SDK-PROCESSING]"
echo " "
openapi-generator generate -i https://www.venille-api.livestocx.xyz/docs/engagement-service-json -g dart-dio -o ../infra_sdk/engagement --enable-post-process-file --additional-properties=pubName=engagement_sdk,pubLibrary=engagement_api.api

echo " "
echo "...[GENERATE-ENGAGEMENT-SDK-SUCCESS]"
echo " "


echo " "
echo "...[GENERATE-PERIOD-TRACKER-SDK-PROCESSING]"
echo " "
openapi-generator generate -i https://www.venille-api.livestocx.xyz/docs/period-tracker-service-json -g dart-dio -o ../infra_sdk/period-tracker --enable-post-process-file --additional-properties=pubName=period_tracker_sdk,pubLibrary=period_tracker_api.api

echo " "
echo "...[GENERATE-PERIOD-TRACKER-SDK-SUCCESS]"
echo " "


echo " "
echo "...[GENERATE-SDKS-SUCCESSFUL]"
