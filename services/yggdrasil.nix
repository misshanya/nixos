{ ... }:

{
  services.yggdrasil = {
    enable = true;
    persistentKeys = false;

    settings = {
      Peers = [
        # Moscow
        "tcp://ygg-msk-1.averyan.ru:8363"
        "tls://ygg-msk-1.averyan.ru:8362"
        "quic://ygg-msk-1.averyan.ru:8364"
        "tcp://yggno.de:18226"
        "tcp://45.147.200.202:12402"
        "tls://ygg.med-dev-systems.ru:6221"
        "tcp://ygg-ru.lskd.pw:30041"
        "tls://ygg-ru.lskd.pw:30042"
        "quic://ygg-ru.lskd.pw:30043"

        # Helsinki
        "tcp://ygg-hel-1.wgos.org:45170"
        "tls://ygg-hel-1.wgos.org:45171"
        "quic://ygg-hel-1.wgos.org:45171"
        "tls://204.168.147.93:1337"

        # Stockholm
        "quic://77.91.84.76:65535"
        "tls://sto01.yggdrasil.hosted-by.skhron.eu:8884"
      ];

      IfName = "ygg0";
    };
  };

  users.users.mishanya.extraGroups = [ "yggdrasil" ];
}
