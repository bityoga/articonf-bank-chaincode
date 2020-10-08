#!/bin/bash
set -x #echo on

CHAINCODE_NAME="bank"
CHANNEL_NAME="appchannel"
INVOKE_PARAMS='{"Args":["CreateAsset","srk","1000","Initial Credit"]}' 

export PEER_HOST=peer2
export CORE_PEER_ADDRESS=${PEER_HOST}:7051
export CORE_PEER_MSPCONFIGPATH=/root/CLI/${ORGCA_HOST}/${ADMIN_USER}/msp
export CORE_PEER_TLS_ROOTCERT_FILE=/root/CLI/${ORGCA_HOST}/${PEER_HOST}/msp/tls/ca.crt

CORE_PEER_ADDRESS=$CORE_PEER_ADDRESS CORE_PEER_MSPCONFIGPATH=/root/CLI/${ORGCA_HOST}/${PEER_HOST}/msp CORE_PEER_TLS_ROOTCERT_FILE=$CORE_PEER_TLS_ROOTCERT_FILE peer chaincode invoke -C $CHANNEL_NAME -n $CHAINCODE_NAME -c $INVOKE_PARAMS -o ${ORDERER_HOST}:7050 --tls --cafile ${CORE_PEER_TLS_ROOTCERT_FILE}
