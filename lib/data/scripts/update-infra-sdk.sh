echo "...[REBUILDING-AUTH-SDK-PROCESSING]"
echo " "

openapi-generator generate -i https://www.venille-api.livestocx.xyz/docs/auth-service-json -g dart-dio -o ../infra_sdk/auth --enable-post-process-file --additional-properties=pubName=auth_sdk,pubLibrary=auth_api.api

echo " "
echo "...[REBUILDING-AUTH-SDK-SUCCESS]"
echo " "

sh update-infra-sdk-files.sh

sh build-infra-sdk.sh
