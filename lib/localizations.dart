import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'l10n/messages_all.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }
 

  String get title {
    return Intl.message('Contact Us', name: 'title');
  }

  String get btnsubmit {
    return Intl.message('Submit', name: 'btnsubmit');
  }

  String get locale {
    return Intl.message('en', name: 'locale');
  }

  String get lblname {
    return Intl.message('Name', name: 'lblname');
  }

  String get lblphone {
    return Intl.message('Phone', name: 'lblphone');
  }

  String get lblemail {
    return Intl.message('Email', name: 'lblemail');
  }
  String get lbltest {
    return Intl.message('Test', name: 'lbltest');
  }
  String get lblRemember{
    return Intl.message('Remember', name: 'lblRemember');
  }
  ///////////////


String get lblWeb_Information{
  return Intl.message('Web_Information', name: 'lblWeb_Information');
}
String get lblContact_Information{
  return Intl.message('Contact_Information', name: 'lblContact_Information');
}
String get lblgetupload_text{
  return Intl.message('getupload_text', name: 'lblgetupload_text');
}
String get lblgetupload{
  return Intl.message('upload', name: 'lblgetupload');
}
String get lblTimes{
  return Intl.message('lblTimes', name: 'lblTimes');
}
String get lblSceen{
  return Intl.message('lblSceen', name: 'lblSceen');
}
String get lblYear{
  return Intl.message('lblYear', name: 'lblYear');
}
String get lblProgramming{
   return Intl.message('Programming', name: 'lblProgramming');
}
String get lblDesgins{
  return Intl.message('Desgins', name: 'lblDesgins');
}
String get lblEMarketing_compaigns{
  return Intl.message('EMarketing_compaigns', name: 'lblEMarketing_compaigns');
}
 String get lblOur_Services {
    return Intl.message('Our_Services', name: 'lblOur_Services');
  }

 String get lblLast_Ads{
    return Intl.message('Last_Ads', name: 'lblLast_Ads');
  }

 String get lblOffers{
    return Intl.message('Offers', name: 'lblOffers');
  }

 String get lblHome{
    return Intl.message('Home', name: 'lblHome');
  }
String get lblMy_Orders{
 return Intl.message('My_Orders', name: 'lblMy_Orders'); 
}
String get lblPayment{
  return Intl.message('Payment', name: 'lblPayment'); 

}

String get lblnamePlaceholder{
  return Intl.message('namePlaceholder', name: 'lblnamePlaceholder');
}
String get lblphonePlaceholder{
  return Intl.message('phonePlaceholder', name: 'lblphonePlaceholder');
}
String get lblSignUp{
  return Intl.message('SignUp', name: 'lblSignUp');
}
String get lblAgreeTerms{
  return Intl.message('AgreeTerms', name: 'lblAgreeTerms');
}
String get lblTerms_and_Conditions{
  return Intl.message('Terms_and_Conditions', name: 'lblTerms_and_Conditions');
}
String get lblAboutApp{
 return Intl.message('AboutApp', name: 'lblAboutApp'); 
}
String get lbllogout{
  return Intl.message('logout', name: 'lbllogout');
}
String get lblContact_Us{
  return Intl.message('Contact_Us', name: 'lblContact_Us'); 
}
String get lblUploadPhoto{
  return Intl.message('UploadPhoto', name: 'lblUploadPhoto');
}

String get lblCountry {
    return Intl.message('Country', name: 'lblCountry'); 
  }

  String get lblCity {
    return Intl.message('City', name: 'lblCity'); 
  }

  String get lblDistrict {
    return Intl.message('District', name: 'lblDistrict'); 
  }

  String get lblSector {
    return Intl.message('Sector', name: 'lblSector'); 
  }

  String get lblDiscount {
    return Intl.message('Discount', name: 'lblDiscount'); 
  }

  String get lblFor_Application_Customers {
    return Intl.message('For_Application_Customers', name: 'lblFor_Application_Customers'); 
  }

  String get lblUnit {
    return Intl.message('Unit', name: 'lblUnit'); 
  }

  String get lblDescription {
    return Intl.message('Description', name: 'lblDescription'); 
  }

  String get lblNext {
    return Intl.message('Next', name: 'lblNext'); 
  }

  String get lblLogos {
    return Intl.message('Logos', name: 'lblLogos'); 
  }
  String get lblLogo {
    return Intl.message('Logo', name: 'lblLogo'); 
  }

  String get lblCreatAccount {
   return Intl.message('CreatAccount', name: 'lblCreatAccount'); 
  }
  String get lblEName{
    return Intl.message('lblName', name: 'lblEName'); 
  }
  String get lblAName{
    return Intl.message('AName', name: 'lblAName'); 
  }
  String get lblSendUs{
    return Intl.message('SendUs', name: 'lblSendUs'); 
  }
  String get lblDescriptionPlaceholder{
    return Intl.message('DescriptionPlaceholder', name: 'lblDescriptionPlaceholder'); 
  }
  String get lblContactInformation{
    return Intl.message('ContactInformation', name: 'lblContactInformation'); 
  }
  String get lblComplaint{
    return Intl.message('Complaint', name: 'lblComplaint'); 
  }
  String get lblMessage{
    return Intl.message('Message', name: 'lblMessage'); 
  }
  String get lblFrom{
   return Intl.message('From', name: 'lblFrom'); 
  }
  String get lblSend{
    return Intl.message('Send', name: 'lblSend'); 
  }
  String get lblPayNow{
   return Intl.message('PayNow', name: 'lblPayNow');  
  }
  String get lblMobileAppName{
    return Intl.message('MobileAppName', name: 'lblMobileAppName'); 
  }
  String get lblMobileDomainName{
    return Intl.message('MobileDomainName', name: 'lblMobileDomainName'); 
  }
  String get lblCompany{
    return Intl.message('Company', name: 'lblCompany');
  }
  String get lblFirstNum{
    return Intl.message('FirstNum', name: 'lblFirstNum'); 
  }
  String get lblFirstNumPlaceholder{
    return Intl.message('FirstNumPlaceholder', name: 'lblFirstNumPlaceholder'); 
  }
  String get lblSecondNum{
    return Intl.message('SecondNum', name: 'lblSecondNum'); 
  }
  String get lblSecondNumPlaceholder{
    return Intl.message('SecondNumPlaceholder', name: 'lblSecondNumPlaceholder'); 
  }
  String get lblEmailSample{
    return Intl.message('EmailSample', name: 'lblEmailSample'); 
  }
  String get lblFacebook{
    return Intl.message('Facebook', name: 'lblFacebook'); 
  }
String get lblGoogle{
      return Intl.message('lblGoogle', name: 'lblGoogle'); 

}
  String get lblTwitter{
    return Intl.message('Twitter', name: 'lblTwitter'); 
  }
  String get lblInstagram{
    return Intl.message('Instagram', name: 'lblInstagram'); 
  }
String get lblSnapShat{
  return Intl.message('SnapShat', name: 'lblSnapShat'); 
}
String get lblViewNumbers{
  return Intl.message('ViewNumbers', name: 'lblViewNumbers'); 
}
String get lblDuration{
  return Intl.message('Duration', name: 'lblDuration'); 
}
String get lblAge{
  return Intl.message('Age', name: 'lblAge'); 
}
String get lblYoutube{
  return Intl.message('Youtube', name: 'lblYoutube'); 
}
  
  String get lblImages {
    return Intl.message('Images', name: 'lblImages'); 
  }

  String get lblVideo_2D_3D {
    return Intl.message('Video_2D_3D', name: 'lblVideo_2D_3D'); 
  }

  String get lblInfographics {
    return Intl.message('Infographics', name: 'lblInfographics'); 
  }

  String get lblAdsVideo {
    return Intl.message('Ads Video making', name: 'lblAdsVideo');
  }

  String get lblApp_Information{
    return Intl.message('App_Information', name: 'lblApp_Information');
  }

  String get lblLogo_Information {
    return Intl.message('Logo_Information', name: 'lblLogo_Information'); 
  }

  String get lblContact_with {
    return Intl.message('Contact_with', name: 'lblContact_with');
  }

  String get lblImage_Information {
    return Intl.message('Image_Information', name: 'lblImage_Information');
  }

  String get lblVideo_Information {
    return Intl.message('Video_Information', name: 'lblVideo_Information');
  }

  String get lblcolors {
    return Intl.message('colors', name: 'lblcolors');
  }

String get lblcolorTxt {
    return Intl.message('', name: 'lblcolorTxt');
  }

  String get lblMobile_App {
    return Intl.message('Mobile_App', name: 'lblMobile_App');
  }
  String get lblAddNotify{
    return Intl.message('lblAddNotify', name: 'lblAddNotify');
  }
  String get lblSubTotal{
    return Intl.message('SubTotal', name: 'lblSubTotal');
  }
 String get lblCustomerName{
       return Intl.message('lblCustomerName', name: 'lblCustomerName');
 }
 String get lblSuccess{
          return Intl.message('lblSuccess', name: 'lblSuccess');
 }
 String get lblThanks{
          return Intl.message('lblThanks', name: 'lblThanks');
 }
 String get lblContactSoon{
             return Intl.message('lblContactSoon', name: 'lblContactSoon');
 }
 String get lblAhly{
      return Intl.message('lblAhly', name: 'lblAhly');
 }
 String get lblAlRaghy{
      return Intl.message('lblAlRaghy', name: 'lblAlRaghy');
 }
 String get lblSampa{
      return Intl.message('lblSampa', name: 'lblSampa');
 }
 String get lblAlEnma{
      return Intl.message('lblAlEnma', name: 'lblAlEnma');
 }
 String get lblSap{
      return Intl.message('lblSap', name: 'lblSap');
 }
String get lblMyBills{
 return Intl.message('lblMyBills', name: 'lblMyBills'); 
}
 String get lblChangePassword{
    return Intl.message('lblChangePassword', name: 'lblChangePassword'); 
 }
 String get lblAccountTransfer{
      return Intl.message('lblAccountTransfer', name: 'lblAccountTransfer');
 }
 String get lblWhoTransfer{
         return Intl.message('lblWhoTransfer', name: 'lblWhoTransfer');
 }
 String get lblDone{
           return Intl.message('lblDone', name: 'lblDone'); 
 }
 String get lblAccountTransferTo{
      return Intl.message('lblAccountTransferTo', name: 'lblAccountTransferTo');
 }
  String get lblAccountNo{
        return Intl.message('lblAccountNo', name: 'lblAccountNo');
  }
  String get lblPaymentTitle{
   return Intl.message('PaymentTitle', name: 'lblPaymentTitle'); 
  }
  String get lblIBAN{
      return Intl.message('lblIBAN', name: 'lblIBAN');  
  }
  String get lblCopy{
       return Intl.message('Copy', name: 'lblCopy'); 
  }
  String get lblAtBank{
    return Intl.message('AtBank', name: 'lblAtBank'); 
  }
   String get lblTotal{
    return Intl.message('Total', name: 'lblTotal');
  }
  String get lblTax{
    return Intl.message('Tax', name: 'lblTax');
  }
  String get lblWeb_Desgin {
    return Intl.message('Web_Desgin', name: 'lblWeb_Desgin');
  }
  String get lblSocialMediaList{
    return Intl.message('SocialMediaList', name: 'lblSocialMediaList');
  }
  String get lblContinus{
   return Intl.message('lblContinus', name: 'lblContinus'); 
  }
  String get lblServicePrice{
    return Intl.message('lblServicePrice', name: 'lblServicePrice'); 
  }
  String get lblGovFacebook{
    return Intl.message('lblGovFacebook', name: 'lblGovFacebook'); 
  }
  String get lblGovYoutube{
    return Intl.message('lblGovYoutube', name: 'lblGovYoutube'); 
  }
  String get lblSpecialYoutube{
    return Intl.message('lblSpecialYoutube', name: 'lblSpecialYoutube'); 
  }
  String get lblCharitiesYoutube{
    return Intl.message('lblCharitiesYoutube', name: 'lblCharitiesYoutube'); 
  }
  String get lblGovTwitter{
    return Intl.message('lblGovTwitter', name: 'lblGovTwitter'); 
  }
  String get lblGovInstagram{
    return Intl.message('lblGovInstagram', name: 'lblGovInstagram'); 
  }
  String get lblGovGoogle{
    return Intl.message('lblGovGoogle', name: 'lblGovGoogle'); 
  }
  String get lblGovSnapshat{
    return Intl.message('lblGovSnapshat', name: 'lblGovSnapshat'); 
  }
   String get lblSpecialFacebook{
    return Intl.message('lblSpecialFacebook', name: 'lblSpecialFacebook'); 
  }
  String get lblSpecialTwitter{
    return Intl.message('lblSpecialTwitter', name: 'lblSpecialTwitter'); 
  }
  String get lblSpecialInstagram{
    return Intl.message('lblSpecialInstagram', name: 'lblSpecialInstagram'); 
  }
  String get lblSpecialGoogle{
    return Intl.message('lblSpecialGoogle', name: 'lblSpecialGoogle'); 
  }
  String get lblSpecialSnapshat{
    return Intl.message('lblSpecialSnapshat', name: 'lblSpecialSnapshat'); 
  }
  String get lblServiceAdded{
    return Intl.message('lblServiceAdded', name: 'lblServiceAdded'); 
  }
  String get lblPleaseInsertEmail{
    return Intl.message('lblPleaseInsertEmail', name: 'lblPleaseInsertEmail'); 
  }
  String get lblEnterYourData{
    return Intl.message('lblEnterYourData', name: 'lblEnterYourData'); 
  }
  String get lblCheckEmail{
    return Intl.message('lblCheckEmail', name: 'lblCheckEmail'); 
  }
  String get lblDoYouRememberPass{
    return Intl.message('lblDoYouRememberPass', name: 'lblDoYouRememberPass'); 
  }
   String get lblCharitiesFacebook{
    return Intl.message('lblCharitiesFacebook', name: 'lblCharitiesFacebook'); 
  }
  String get lblCharitiesTwitter{
    return Intl.message('lblCharitiesTwitter', name: 'lblCharitiesTwitter'); 
  }
  String get lblCharitiesInstagram{
    return Intl.message('lblCharitiesInstagram', name: 'lblCharitiesInstagram'); 
  }
  String get lblCharitiesGoogle{
    return Intl.message('lblCharitiesGoogle', name: 'lblCharitiesGoogle'); 
  }
  String get lblCharitiesSnapshat{
    return Intl.message('lblCharitiesSnapshat', name: 'lblCharitiesSnapshat'); 
  }
 String get lblUpdateProfile{
          return Intl.message('lblUpdateProfile', name: 'lblUpdateProfile');   
 }
  String get lblFollowers{
        return Intl.message('lblFollowers', name: 'lblFollowers');  
  }
  String get lblOpenGalary{
            return Intl.message('lblOpenGalary', name: 'lblOpenGalary');  

  }
  String get lblRyal{
    return Intl.message('lblRyal', name: 'lblRyal'); 
  }
  String get lblUserNotFound{
    return Intl.message('lblUserNotFound', name: 'lblUserNotFound'); 
  }
  String get lblNo{
     return Intl.message('lblNo', name: 'lblNo'); 
  }
    String get lblOrder{
     return Intl.message('lblOrder', name: 'lblOrder'); 
  }
    String get lblPrice{
     return Intl.message('lblPrice', name: 'lblPrice'); 
  }
  String get lblPleaseFillInputs{
    return Intl.message('lblPleaseFillInputs', name: 'lblPleaseFillInputs'); 
  }
  String get lblGoCart{
   return Intl.message('lblGoCart', name: 'lblGoCart'); 
  }
  String get lblSave{
    return Intl.message('Save', name: 'lblSave');
  }
  String get getAboutAppDes {
    return Intl.message('getAboutAppDes', name: 'lblgetAboutAppDes');
  }
String get lblLogin_Welcome {
    return Intl.message('Login_Welcome', name: 'lblLogin_Welcome');
  }
  String get lblViewTxt{
    return Intl.message('ViewTxt', name: 'lblViewTxt');
  }
  String get lblLogoSrc{
    return Intl.message('LogoSrc', name: 'lblLogoSrc');
  }
  String get lblemailPlaceholder{
    return Intl.message('emailPlaceholder', name: 'lblemailPlaceholder');
  }
   String get lblpassword{
    return Intl.message('password', name: 'lblpassword');
  }
  String get lblpasswordPlaceholder{
    return Intl.message('passwordPlaceholder', name: 'lblpasswordPlaceholder');
  }
  String get lblOr{
    return Intl.message('Or', name: 'lblOr');
  }
  String get lblLoginWithGmail{
    return Intl.message('LoginWithGmail', name: 'lblLoginWithGmail');
  }
  String get lblHaveAccount{
    return Intl.message('HaveAccount', name: 'lblHaveAccount');
  }
  String get lbllogin{
    return Intl.message('login', name: 'lbllogin');
  }
  String get lblConfirmationCode{
    return Intl.message('ConfirmationCode', name: 'lblConfirmationCode');
  }
  String get lblPleaseInsertCode{
    return Intl.message('PleaseInsertCode', name: 'lblPleaseInsertCode');
  }
  String get lblConfirm{
    return Intl.message('Confirm', name: 'lblConfirm');
  }
  String get lblFamous{
    return Intl.message('lblFamous', name: 'lblFamous');
  }
}

class SpecificLocalizationDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalizations> load(Locale locale) =>
      AppLocalizations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}

class FallbackCupertinoLocalisationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) => SynchronousFuture<_DefaultCupertinoLocalizations>(_DefaultCupertinoLocalizations(locale));

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

class _DefaultCupertinoLocalizations extends DefaultCupertinoLocalizations {
  final Locale locale;
  
  _DefaultCupertinoLocalizations(this.locale);

 
}
