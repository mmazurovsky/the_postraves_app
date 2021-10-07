class SocialLinksHelper {

  static String getInstagramLinkForNickname(String nickname) {
    return 'https://instagram.com/$nickname';
  }

  static String getTelegramLinkForNickname(String nickname) {
    return 'https://t.me/$nickname';
  }

    static String getBandcampLinkForNickname(String nickname) {
    return 'https://$nickname.bandcamp.com';
  }

  static String getSoundcloudLinkForNickname(String nickname) {
    return 'https://soundcloud.com/$nickname';
  }
}
