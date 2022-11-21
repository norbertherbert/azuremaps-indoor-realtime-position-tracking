echo "Post deployment script starting..."

iothubname=$1
rgname=$2
location=$3
funcappid=$4
storagename=$5
containername=$6
storagecs=$7

echo "iot hub name: ${iothubname}"
echo "location: ${location}"
echo "funcappid: ${funcappid}"
echo "storagename: ${storagename}"
echo "containername: ${containername}"
echo "storagecs: ${storagecs}"

echo "Installing azure cli extension..."
az config set extension.use_dynamic_install=yes_without_prompt
az extension add --name azure-iot -y

echo "Retrieving files..."
git clone https://github.com/Azure-Samples/azuremaps-indoor-realtime-position-tracking.git

echo "Retrieving and uploading public files to blob storage..."
az storage blob upload-batch --connection-string $storagecs --account-name $storagename -d $containername -s "./src/public"

echo "Post deployment script completed!"