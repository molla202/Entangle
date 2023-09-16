![image](https://github.com/molla202/Entangle/assets/91562185/e3546025-de57-498c-b68f-0d319a3d429f)



https://discord.gg/entanglefi
## Gereklilikleri kuralım
```
sudo apt update && sudo apt upgrade -y
sudo apt install curl git wget htop tmux build-essential jq make gcc -y
```
## Go Kurulumu Yapıyoruz
```
cd $HOME
VER="1.19.3"
wget "https://golang.org/dl/go$VER.linux-amd64.tar.gz"
sudo tar -C /usr/local -xzf "go$VER.linux-amd64.tar.gz"
rm -rf  "go$VER.linux-amd64.tar.gz"
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
source $HOME/.bash_profile
go version
```
## Python3.7+  yüklüyoruz
```
sudo apt update && sudo apt install python3.10-venv
```
Not: Burda hata alırsanız önemsemeyin devam
## Python3 Pip ve venv yüklüyoruz  
```
sudo apt update
sudo apt install python3-venv python3-pip
```

### Dosyaları çekiyoruz
```
git clone https://github.com/Entangle-Protocol/entangle-blockchain
cd entangle-blockchain
```
```
make install
```
### Cüzdan Oluşturma
Not: cüzdan adı ve şifre girelim
```
sh init_key.sh cüzdan-adı şifregir
```
### Snap Çekelim 70gb civarı
```
cd
curl -sSL -o get_snapshot.sh https://raw.githubusercontent.com/molla202/Entangle/main/get_snapshot.sh && chmod +x get_snapshot.sh && bash ./get_snapshot.sh
```
### İnit işlemi
```
entangled init moniker-yazınız --chain-id entangle_33133-1
```
```
cd
cd entangle-blockchain
cp config/genesis.json $HOME/.entangled/config/
cp config/config.toml $HOME/.entangled/config/
```
### Servis oluşturuyoruz
```
sudo tee /etc/systemd/system/entangled.service > /dev/null <<EOF
[Unit]
Description=entangle node
After=network-online.target
[Service]
User=$USER
ExecStart=$(which entangled) start --pruning=nothing --evm.tracer=json --log_level info --minimum-gas-prices=0.0001aNGL --json-rpc.api eth,txpool,personal,net,debug,web3,miner --api.enable --api.enabled-unsafe-cors
Restart=on-failure
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF
```
### Port değiştirmek isterseniz (opsiyonel)
```
sed -i -e "s%^proxy_app = \"tcp://127.0.0.1:26658\"%proxy_app = \"tcp://127.0.0.1:14658\"%; s%^laddr = \"tcp://127.0.0.1:26657\"%laddr = \"tcp://127.0.0.1:14657\"%; s%^pprof_laddr = \"localhost:6060\"%pprof_laddr = \"localhost:14660\"%; s%^laddr = \"tcp://0.0.0.0:26656\"%laddr = \"tcp://0.0.0.0:14656\"%; s%^prometheus_listen_addr = \":26660\"%prometheus_listen_addr = \":14666\"%" $HOME/.entangled/config/config.toml

sed -i -e "s%^address = \"tcp://0.0.0.0:1317\"%address = \"tcp://0.0.0.0:14617\"%; s%^address = \":8080\"%address = \":14680\"%; s%^address = \"0.0.0.0:9090\"%address = \"0.0.0.0:14690\"%; s%^address = \"0.0.0.0:9091\"%address = \"0.0.0.0:14691\"%; s%:8545%:14645%; s%:8546%:14646%; s%:6065%:14665%" $HOME/.entangled/config/app.toml
```
### Başlatıyoruz
```
sudo systemctl daemon-reload
sudo systemctl enable entangled
sudo systemctl restart entangled && sudo journalctl -u entangled -fo cat
```
### Private key alıp MM eklıyoruz...
NOT: MM ekledikten sonra çıkan adresle Discorddan faucet kanalına verify diyoruz bot mesaj atıyor ona adresi yazıyoruz oda yolluyor
```
entangled keys unsafe-export-eth-key cüzdan-adı
```
### Validator olusturuyoruz
```
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
```
### Delege
```
entangled tx staking delegate \
--chain-id=entangle_33133-1 \
--amount="5000000000000000000aNGL" \
--gas=500000 \
--gas-prices="10aNGL" \
--from=<key_name>
```
### Validator form
```
https://docs.google.com/forms/d/e/1FAIpQLSdbz39mklMegjmw4G4EBzvBbb-IAEOJrooOUwTesIc6xnDGUA/viewform?usp=send_form
```
