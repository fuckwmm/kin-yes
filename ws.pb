message "log" {

  message LOG {
    required string loglevel = 0
  }

  required LOG log = 0

  message INBOUNDS {
    required double port = 0
    required string protocol = 1

    message SETTINGS {

      message CLIENTS {
        required string id = 0
        required string flow = 1
        required double level = 2
        required string email = 3
      }

      repeated CLIENTS clients = 0
      required string decryption = 1

      message FALLBACKS {
        required double dest = 0
      }

      repeated FALLBACKS fallbacks = 2
    }

    required SETTINGS settings = 2

    message STREAMSETTINGS {
      required string network = 0
      required string security = 1

      message XTLSSETTINGS {
        repeated string alpn = 0

        message CERTIFICATES {
          required string certificateFile = 0
          required string keyFile = 1
        }

        repeated CERTIFICATES certificates = 1
      }

      required XTLSSETTINGS xtlsSettings = 2
    }

    required STREAMSETTINGS streamSettings = 3
  }

  repeated INBOUNDS inbounds = 1

  message OUTBOUNDS {
    required string protocol = 0
  }

  repeated OUTBOUNDS outbounds = 2
}
