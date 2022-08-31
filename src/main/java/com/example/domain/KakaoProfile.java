
package com.example.domain;

public class KakaoProfile {

   public Long id;
   public String connected_at;
   public Properties properties;
   public Kakao_account kakao_account;

   public Long getId() {
      return id;
   }

   public void setId(Long id) {
      this.id = id;
   }

   public String getConnected_at() {
      return connected_at;
   }

   public void setConnected_at(String connected_at) {
      this.connected_at = connected_at;
   }

   public Properties getProperties() {
      return properties;
   }

   public void setProperties(Properties properties) {
      this.properties = properties;
   }

   public Kakao_account getKakao_account() {
      return kakao_account;
   }

   public void setKakao_account(Kakao_account kakao_account) {
      this.kakao_account = kakao_account;
   }

   public class Properties {

      public String getNickname() {
         return nickname;
      }

      public void setNickname(String nickname) {
         this.nickname = nickname;
      }

      public String nickname;

   }

   public class Kakao_account {

      public Boolean profile_nickname_needs_agreement;
      public Profile profile;
      public Boolean has_email;
      public Boolean email_needs_agreement;
      public Boolean is_email_valid;
      public Boolean is_email_verified;
      public String email;
      public Boolean has_birthday;
      public Boolean birthday_needs_agreement;
      public String birthday;
      public String birthday_type;
      public Boolean has_gender;
      public Boolean gender_needs_agreement;
      public String gender;

      public Boolean getProfile_nickname_needs_agreement() {
         return profile_nickname_needs_agreement;
      }

      public void setProfile_nickname_needs_agreement(Boolean profile_nickname_needs_agreement) {
         this.profile_nickname_needs_agreement = profile_nickname_needs_agreement;
      }

      public Profile getProfile() {
         return profile;
      }

      public void setProfile(Profile profile) {
         this.profile = profile;
      }

      public Boolean getHas_email() {
         return has_email;
      }

      public void setHas_email(Boolean has_email) {
         this.has_email = has_email;
      }

      public Boolean getEmail_needs_agreement() {
         return email_needs_agreement;
      }

      public void setEmail_needs_agreement(Boolean email_needs_agreement) {
         this.email_needs_agreement = email_needs_agreement;
      }

      public Boolean getIs_email_valid() {
         return is_email_valid;
      }

      public void setIs_email_valid(Boolean is_email_valid) {
         this.is_email_valid = is_email_valid;
      }

      public Boolean getIs_email_verified() {
         return is_email_verified;
      }

      public void setIs_email_verified(Boolean is_email_verified) {
         this.is_email_verified = is_email_verified;
      }

      public String getEmail() {
         return email;
      }

      public void setEmail(String email) {
         this.email = email;
      }

      public Boolean getHas_birthday() {
         return has_birthday;
      }

      public void setHas_birthday(Boolean has_birthday) {
         this.has_birthday = has_birthday;
      }

      public Boolean getBirthday_needs_agreement() {
         return birthday_needs_agreement;
      }

      public void setBirthday_needs_agreement(Boolean birthday_needs_agreement) {
         this.birthday_needs_agreement = birthday_needs_agreement;
      }

      public String getBirthday() {
         return birthday;
      }

      public void setBirthday(String birthday) {
         this.birthday = birthday;
      }

      public String getBirthday_type() {
         return birthday_type;
      }

      public void setBirthday_type(String birthday_type) {
         this.birthday_type = birthday_type;
      }

      public Boolean getHas_gender() {
         return has_gender;
      }

      public void setHas_gender(Boolean has_gender) {
         this.has_gender = has_gender;
      }

      public Boolean getGender_needs_agreement() {
         return gender_needs_agreement;
      }

      public void setGender_needs_agreement(Boolean gender_needs_agreement) {
         this.gender_needs_agreement = gender_needs_agreement;
      }

      public String getGender() {
         return gender;
      }
      public void setGender(String gender) {
         this.gender = gender;
      }
      public class Profile {

         public String nickname;

         public String getNickname() {
            return nickname;
         }
         public void setNickname(String nickname) {
            this.nickname = nickname;
         } 
      }
   }
}