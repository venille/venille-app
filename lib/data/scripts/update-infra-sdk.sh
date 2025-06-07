echo "...[REBUILDING-AUTH-SDK-PROCESSING]"
echo " "

openapi-generator generate -i https://www.venille-api.livestocx.xyz/docs/auth-service-json -g dart-dio -o ../infra_sdk/auth --enable-post-process-file --additional-properties=pubName=auth_sdk,pubLibrary=auth_api.api

echo " "
echo "...[REBUILDING-AUTH-SDK-SUCCESS]"
echo " "


echo "...[REBUILDING-ACCOUNT-SDK-PROCESSING]"
echo " "

openapi-generator generate -i https://www.venille-api.livestocx.xyz/docs/account-service-json -g dart-dio -o ../infra_sdk/account --enable-post-process-file --additional-properties=pubName=account_sdk,pubLibrary=account_api.api

echo " "
echo "...[REBUILDING-ACCOUNT-SDK-SUCCESS]"
echo " "


echo "...[REBUILDING-ENGAGEMENT-SDK-PROCESSING]"
echo " "

openapi-generator generate -i https://www.venille-api.livestocx.xyz/docs/engagement-service-json -g dart-dio -o ../infra_sdk/engagement --enable-post-process-file --additional-properties=pubName=engagement_sdk,pubLibrary=engagement_api.api

echo " "
echo "...[REBUILDING-ENGAGEMENT-SDK-SUCCESS]"
echo " "


echo "...[REBUILDING-PERIOD-TRACKER-SDK-PROCESSING]"
echo " "

openapi-generator generate -i https://www.venille-api.livestocx.xyz/docs/period-tracker-service-json -g dart-dio -o ../infra_sdk/period-tracker --enable-post-process-file --additional-properties=pubName=period_tracker_sdk,pubLibrary=period_tracker_api.api

echo " "
echo "...[REBUILDING-PERIOD-TRACKER-SDK-SUCCESS]"
echo " "

sh update-infra-sdk-files.sh

sh build-infra-sdk.sh
