


https://discord.gg/entanglefi


git clone https://github.com/Entangle-Protocol/entangle-blockchain
cd entangle-blockchain

make install

sh init_key.sh <key_name> <password>

sh get_snapshot.sh

sh run_node.sh


entangled keys unsafe-export-eth-key <key_name>



entangled tx staking create-validator \
--amount="5000000000000000000aNGL" \
--pubkey=$(entangled tendermint show-validator) \
--moniker="validator" \
--chain-id=entangle_33133-1 \
--commission-rate="0.10" \
--commission-max-rate="0.20" \
--commission-max-change-rate="0.01" \
--min-self-delegation="1" \
--gas=500000 \
--gas-prices="10aNGL" \
--from=<key_name>


https://docs.google.com/forms/d/e/1FAIpQLSdbz39mklMegjmw4G4EBzvBbb-IAEOJrooOUwTesIc6xnDGUA/viewform?usp=send_form

