/*
 base on CAPICOM version 2.0
*/
    //Encrypt Algorithm Constants 
    var CAPICOM_ENCRYPTION_ALGORITHM_RC2 = 0;
    var CAPICOM_ENCRYPTION_ALGORITHM_RC4 = 1;
    var CAPICOM_ENCRYPTION_ALGORITHM_DES = 2;
    var CAPICOM_ENCRYPTION_ALGORITHM_3DES = 3;
    var CAPICOM_ENCRYPTION_ALGORITHM_AES = 4;
    
    //Encrypt KeyLength Constants
    var CAPICOM_ENCRYPTION_KEY_LENGTH_MAXIMUM = 0;
    var CAPICOM_ENCRYPTION_KEY_LENGTH_40_BITS = 1;
    var CAPICOM_ENCRYPTION_KEY_LENGTH_56_BITS = 2;
    var CAPICOM_ENCRYPTION_KEY_LENGTH_128_BITS = 3; 
    var CAPICOM_ENCRYPTION_KEY_LENGTH_192_BITS = 4; 
    var CAPICOM_ENCRYPTION_KEY_LENGTH_256_BITS = 5; 
    
    var CAPICOM_SECRET_PASSWORD = 0;
    //Encoding Type Constants
    var CAPICOM_ENCODE_BASE64 = 0;
    var CAPICOM_ENCODE_BINARY = 1;
    var CAPICOM_ENCODE_ANY = -1;
    
    //Hash Data Algorithm Constants
    var CAPICOM_HASH_ALGORITHM_SHA1 = 0;
    var CAPICOM_HASH_ALGORITHM_MD2 = 1;
    var CAPICOM_HASH_ALGORITHM_MD4 = 2;
    var CAPICOM_HASH_ALGORITHM_MD5 = 3;
    
    //Store Open Mode
    var CAPICOM_STORE_OPEN_READ_ONLY                              = 0
    var CAPICOM_STORE_OPEN_READ_WRITE                             = 1
    var CAPICOM_STORE_OPEN_MAXIMUM_ALLOWED                        = 2
    var CAPICOM_STORE_OPEN_EXISTING_ONLY                        = 128
    var CAPICOM_STORE_OPEN_INCLUDE_ARCHIVED                     = 256
    
    //Store Location Constants
    var CAPICOM_LOCAL_MACHINE_STORE                             = 1
    var CAPICOM_CURRENT_USER_STORE                              = 2
    var CAPICOM_ACTIVE_DIRECTORY_USER_STORE                     = 3
    var CAPICOM_SMART_CARD_USER_STORE                           = 4

    var CAPICOM_CERTIFICATE_FIND_SHA1_HASH = 0;
    var CAPICOM_CERTIFICATE_FIND_EXTENDED_PROPERTY = 6;
    var CAPICOM_CERTIFICATE_FIND_TIME_VALID = 9;
    var CAPICOM_CERTIFICATE_FIND_KEY_USAGE = 12;
    
    var CAPICOM_DIGITAL_SIGNATURE_KEY_USAGE = 0x00000080;
    var CAPICOM_AUTHENTICATED_ATTRIBUTE_SIGNING_TIME = 0;
    var CAPICOM_INFO_SUBJECT_SIMPLE_NAME = 0;

    var CAPICOM_E_CANCELLED = -2138568446;
    var CERT_KEY_SPEC_PROP_ID = 6;
    
    var CAPICOM_VERIFY_SIGNATURE_ONLY = 0;
    var	CAPICOM_VERIFY_SIGNATURE_AND_CERTIFICATE = 1;
	
    var ROOT_CERTIFICATE_NAME = "Extract Software CA";

    
    // check if CAPICOM has been installed.
    if (IsCAPICOMInstalled() != true){
    	// Alert the that CAPICOM was not able to be installed
    	alert("CAPICOM could not be loaded, possibly due to insufficient access privileges on this machine.");	
    }
    
    
    function IsCAPICOMInstalled(){
      if(typeof(oCAPICOM) == "object"){
	if( (oCAPICOM.object != null) )	{
		// We found CAPICOM!
		return true;
	}
      }
    }
    
//encrypt and decrypt data
//param keyLength should be one of the CAPICOM_ENCRYPTION_KEY_LENGTH
//param algorithm should be one of the CAPICOM_ENCRYPTION_ALGORITHM
    function encryptData(plainText,pwd,keyLength,algorithm){
    	// only attempt to has if data has been supploed
    	if (plainText == "" || pwd == "")
    	  return "";
    	  
    	if(keyLength==null) keyLength=CAPICOM_ENCRYPTION_KEY_LENGTH_192_BITS;
    	if(algorithm==null) algorithm=CAPICOM_ENCRYPTION_ALGORITHM_3DES;
    	  
  		var cipherText;
  		
  		// instantiate the CAPICOM objects
  		var EncryptedData = new ActiveXObject("CAPICOM.EncryptedData");
  		
  		// Setup the Algorithm object
  		EncryptedData.Algorithm.KeyLength = keyLength;
  		EncryptedData.Algorithm.Name = algorithm;
  
  		// Set the secret to be used when deriving the key
  		EncryptedData.SetSecret(pwd,CAPICOM_SECRET_PASSWORD);
  		
  		// Provide the Encrypted Data object with the text to encrypt
  		EncryptedData.Content = plainText;
  		
  		// Encrypt the data and return it in Base64 to the txtCipherText object
  		try{
  		   cipherText = EncryptedData.Encrypt(CAPICOM_ENCODE_BASE64);
  		}catch (e){
  		   alert(e.description);
  		}
  		
  		// clean up
  		EncryptedData = null;
  		
  		return cipherText;
    }
    
    function decryptData(cipherText,pwd)
    {
    	// only attempt to has if data has been supploed
    	if (cipherText == "" || pwd == "")
    	  return "";
    	  
    	var plainText;

  		// instantiate the CAPICOM objects
  		var EncryptedData = new ActiveXObject("CAPICOM.EncryptedData");
  		
  		// The EncryptedData object stores the encryption algorith and key length
  		// allong with the CipherText so that the all the relying party needs to know
  		// is the password that was used to derive the secret key.
  		
  		// Set the secret to be used when deriving the secret key
  		EncryptedData.SetSecret(pwd,CAPICOM_SECRET_PASSWORD);
  		
  		// decrypt the data in the txtCipherText field
  		try
  		{
  			EncryptedData.Decrypt(cipherText);
  		}
  		catch (e)
  		{
  			alert(e.description);
  		}
  		
  		plainText = EncryptedData.Content;
  
  		// clean up
  		EncryptedData = null;
  		
  		return plainText;
    }

//hash data
//param algorithm should be one of the CAPICOM_HASH_ALGORITHM
    function hashData(srcText,algorithm)
    {
    	// only attempt to has if data has been supploed
    	if (srcText == "")
    	  return "";
    	  
    	var hashData;
    
    	// instantiate the CAPICOM objects
    	var HashedData = new ActiveXObject("CAPICOM.HashedData");
    	
    	// place in a try block so we catch any errors
    	try
    	{
    		// set the algorithm
    		HashedData.Algorithm=algorithm;
    		
    		// set the data to hash
    		HashedData.Hash(srcText);
    
    		hashData = HashedData.Value;
    	}
    	catch (e)
    	{
    		alert("An error occured while calculating a has over the supploed data, the error was: " + e.description + "\nThe hash algorith being used was: " + HashedData.Algorithm);
    	}
    	
    	return hashData;
    }

//certificate
    function findAllByThumbprintAndDisplay(szThumbprint)
    {	
    	// we expect the hash to be in hex, minimaly anything in hex will be two characters long
    	if (szThumbprint.length < 2)
    	{
    		alert("you must specify a thumbprint");
    		return false;
    	}
    
    	// instantiate the CAPICOM Store objects
    	var MyStore = new ActiveXObject("CAPICOM.Store");
    	var AddrStore = new ActiveXObject("CAPICOM.Store");
    	var CAStore = new ActiveXObject("CAPICOM.Store");
    	var RootStore = new ActiveXObject("CAPICOM.Store");
    
    	var iDisplayCount = 0;
    
    	// open the store objects
    	try
    	{
    		MyStore.Open(CAPICOM_CURRENT_USER_STORE, "My", CAPICOM_STORE_OPEN_READ_WRITE);
    		//AddrStore.Open(CAPICOM_CURRENT_USER_STORE, "AddressBook", CAPICOM_STORE_OPEN_READ_WRITE);
    		CAStore.Open(CAPICOM_CURRENT_USER_STORE, "CA", CAPICOM_STORE_OPEN_READ_WRITE);
    		RootStore.Open(CAPICOM_CURRENT_USER_STORE, "Root", CAPICOM_STORE_OPEN_READ_WRITE);
    	}
    	catch (e)
    	{
    		alert("we were unable to open your certificate stores, aborting");
    		return false;
    	}
    
    	// this may take a second so lets update the user with what we are doing
    	window.status="Finding Certificate with the Thumbprint of " + szThumbprint + ".";
    
    	// create an array of all of the stores
    	MyStores = new Array(MyStore, AddrStore, CAStore, RootStore);
    
    	// enumerate through the stores
    	for (iStore = 0; iStore <= (MyStores.length -1); iStore++)
    	{
    		// look for our thumbprint in this store
    		 var Certificates = MyStores[iStore].Certificates.Find(CAPICOM_CERTIFICATE_FIND_SHA1_HASH, szThumbprint);	
    
    		// enumerate through each of the certificates we found (if any)
    		for (iCert = 1; iCert <= (Certificates.Count); iCert++)
    		{
    			try
    			{
    				Certificates.Item(iCert).Display();
    			}
    			catch (e)
    			{
    				alert("we were unable to display the specified certificate, aborting..");
    				return false;
    			}
    		}
    
    	}
    
    	// we are all done so lets update the status
    	window.status="";
    	if (iDisplayCount <= 0)
    	{
    		alert("No instances of this certificate were found");
    	}
    	else
    	{
    		alert("We Found " &  iDisplayCount & " instances of this certificate."); 
    	}
    
    	// clean up
    	MyStore = null;
    	AddrStore = null;
    	CAStore = null;
    	RootStore = null;
    	Certificates = null;
    }

//sign
    //return current user's personal certificates dictionary
    function FilterCertificates()
    {
      // instantiate the CAPICOM objects
      var MyStore = new ActiveXObject("CAPICOM.Store");
      
      // open the current users personal certificate store
      try
      {
        MyStore.Open(CAPICOM_CURRENT_USER_STORE, "My" , CAPICOM_STORE_OPEN_READ_ONLY);
      }
      catch (e)
      {
        if (e.number != CAPICOM_E_CANCELLED)
        {
         	alert("An error occurred while opening your personal certificate store, aborting");
        	return false;
        }
      }
      //var FilteredCertificates = MyStore.Certificates.Find(CAPICOM_CERTIFICATE_FIND_KEY_USAGE,CAPICOM_DIGITAL_SIGNATURE_KEY_USAGE).Find(CAPICOM_CERTIFICATE_FIND_TIME_VALID).Find(CAPICOM_CERTIFICATE_FIND_EXTENDED_PROPERTY,CERT_KEY_SPEC_PROP_ID);
      if(typeof(MyStore.Certificates) == "unknown"){
      	return new Array();
      }
      var Certificates = MyStore.Certificates.Find(CAPICOM_CERTIFICATE_FIND_TIME_VALID);
      return Certificates;
      
      // Clean Up
      MyStore = null;
      FilteredCertificates = null;
    }
    
    //select default certificate with username 
    function initSelectCertificate(username,txtCertificate)
    {
      var selCertificate = getDefaultCertificate(username);
      if(selCertificate!=null)
      {
        txtCertificate.value = selCertificate.GetInfo(CAPICOM_INFO_SUBJECT_SIMPLE_NAME);
        txtCertificate.hash = selCertificate.Thumbprint;
        FilteredCertificates = null;
        return true;
      }else{
        txtCertificate.value = "";
        txtCertificate.hash = "";
        FilteredCertificates = null;
        return false;
      }
    }
    
    //get default certificate with username 
    function getDefaultCertificate(username)
    {
      // Filter the certificates to only those that are good for my purpose
      var FilteredCertificates = FilterCertificates();
      
      // if user's certificate was found then lets show that as the selected certificate
      for (var i=1;i<FilteredCertificates.Count+1;i++){
        if(FilteredCertificates.Item(i).GetInfo(CAPICOM_INFO_SUBJECT_SIMPLE_NAME)==username)
        {
          return FilteredCertificates.Item(i);
        }
      }
      
      // clean up	
      FilteredCertificates = null;
      return null;
    }

    //select a certificate and show in txtCertificate,txtCertificate.hash refer certificate's thumbprint
    //in fact this return certificate's name and it's hash
    function selectCertificate(txtCertificate)
    {
      // retrieve the filtered list of certificates
      var FilteredCertificates = FilterCertificates();
      
      // if only one certificate was found then lets show that as the selected certificate
      if (FilteredCertificates.Count > 0)
      {
        try
        {
          // Pop up the selection UI
          var SelectedCertificate = FilteredCertificates.Select();
          txtCertificate.value = SelectedCertificate.Item(1).GetInfo(CAPICOM_INFO_SUBJECT_SIMPLE_NAME);
          txtCertificate.hash = SelectedCertificate.Item(1).Thumbprint;
        }
        catch (e)
        {
          txtCertificate.value = "";
          txtCertificate.hash = "";
        }
      }
      else
      {
        alert("You have no valid certificates to select from");
      }
      
      // Clean-Up
      SelectedCertificate = null;
      FilteredCertificates = null;
    }
    
    //find certificate by it's hash
    function FindCertificateByHash(szThumbprint)
    {
      if(szThumbprint==null || szThumbprint=='')
        return null;
        
      // instantiate the CAPICOM objects
      var MyStore = new ActiveXObject("CAPICOM.Store");
      var AddrStore = new ActiveXObject("CAPICOM.Store");
      var CAStore = new ActiveXObject("CAPICOM.Store");
      var RootStore = new ActiveXObject("CAPICOM.Store");
      
      // open the current users personal certificate store
      try
      {
    		MyStore.Open(CAPICOM_CURRENT_USER_STORE, "My", CAPICOM_STORE_OPEN_READ_WRITE);
    		//AddrStore.Open(CAPICOM_CURRENT_USER_STORE, "Other", CAPICOM_STORE_OPEN_READ_WRITE);
    		CAStore.Open(CAPICOM_CURRENT_USER_STORE, "CA", CAPICOM_STORE_OPEN_READ_WRITE);
    		RootStore.Open(CAPICOM_CURRENT_USER_STORE, "Root", CAPICOM_STORE_OPEN_READ_WRITE);
    	
      	MyStores = new Array(MyStore, CAStore, RootStore);
      
      	// enumerate through the stores
      	for (iStore = 0; iStore <= (MyStores.length -1); iStore++)
      	{
      		// look for our thumbprint in this store
      		 var Certificates = MyStores[iStore].Certificates.Find(CAPICOM_CERTIFICATE_FIND_SHA1_HASH, szThumbprint);	
           if(Certificates!=null && Certificates.Count>0) 
            return Certificates.Item(1);
        }
      }
      catch (e)
      {
        if (e.number != CAPICOM_E_CANCELLED)
        {
         	alert("An error occurred while opening your personal certificate store, aborting");
        	return null;
        }
  	  }
  
    	// Clean Up
  	  MyStore = null;
  	  FilteredCertificates = null;
    }

    //generate an attached PKCS7 digital signature with a certificate 
    //use this function must catch CANCEL exception
    function signedData(certificateObj,content,encodeType)
    {
  	  if(content==null || content==""){
  	    return "";
  	  }
  	  if(encodeType==null){
  	     encodeType=CAPICOM_ENCODE_BASE64;
  	  }
  	  
  	  
  	  // instantiate the CAPICOM objects
  	  var SignedData = new ActiveXObject("CAPICOM.SignedData");
  	  var Signer = new ActiveXObject("CAPICOM.Signer");
  	  var TimeAttribute = new ActiveXObject("CAPICOM.Attribute");
  
  		// only do this if the user selected a certificate
  		// Set the data that we want to sign
  		SignedData.Content = content;
  		try
  		{
  			// Set the Certificate we would like to sign with
  		 	if(certificateObj!=null)
  		 	  Signer.Certificate = certificateObj;
  		   	
  		 	// Set the time in which we are applying the signature
  			var Today = new Date();
  			TimeAttribute.Name = CAPICOM_AUTHENTICATED_ATTRIBUTE_SIGNING_TIME;
  			TimeAttribute.Value = Today.getVarDate();
  			Today = null;
  			//not add time attribute form server verify
  		 	//Signer.AuthenticatedAttributes.Add(TimeAttribute);
  			
  		 	// Do the Sign operation
  			var szSignature = SignedData.Sign(Signer, false, encodeType);
  			if(encodeType==CAPICOM_ENCODE_BASE64){
  			   szSignature=filter(szSignature);
  			}
  		}
  		catch (e)
  		{
  			if (e.number != CAPICOM_E_CANCELLED)
  			{
  				alert("An error occurred when attempting to sign the content, the errot was: " + e.description);
  				return false;
  			}else throw e;
  		}
  
  	 	return szSignature;
    }
    
		//verify signature ,if verified return true
		function verifySig(signatureData)
		{
			// instantiate the CAPICOM objects
			var SignedData = new ActiveXObject('CAPICOM.SignedData');
			try
			{
				SignedData.Verify(signatureData, false, CAPICOM_VERIFY_SIGNATURE_AND_CERTIFICATE);
			}
			catch (e)
			{
				alert(e.description);
				return false;
			}
			return SignedData.Content;
  		// clean up
  		SignedData = null;
		}
		
//envelop data
    //param keyLength,algorithm is optional
		function envelopData(content,keyLength,algorithm)
		{
    	if (content == "")
    	  return "";
    	  
    	if(keyLength==null) keyLength=CAPICOM_ENCRYPTION_KEY_LENGTH_MAXIMUM;
    	//CAPICOM_ENCRYPTION_KEY_LENGTH_56_BITS;
    	//CAPICOM_ENCRYPTION_KEY_LENGTH_MAXIMUM;
    	//CAPICOM_ENCRYPTION_KEY_LENGTH_192_BITS;
    	if(algorithm==null) algorithm=CAPICOM_ENCRYPTION_ALGORITHM_3DES;
    	//CAPICOM_ENCRYPTION_ALGORITHM_3DES;

			//use Root Certificate as the recipient
			var RootStore = new ActiveXObject("CAPICOM.Store");
			var RootCert;
    
    	try
    	{
    		RootStore.Open(CAPICOM_CURRENT_USER_STORE, "Root", CAPICOM_STORE_OPEN_READ_WRITE);
        var hasRoot = false;
        for (var i=1;i<RootStore.Certificates.Count+1;i++)
          if(RootStore.Certificates.Item(i).GetInfo(CAPICOM_INFO_SUBJECT_SIMPLE_NAME)==ROOT_CERTIFICATE_NAME){
            RootCert = RootStore.Certificates.Item(i);
            hasRoot = true;
            break;
          }
        if(!hasRoot) throw "";
    	}
    	catch (e)
    	{
    		alert("we were unable to open your Root certificate stores, aborting");
    		return false;
    	}

			// instantiate the CAPICOM objects
			var EnvelopedData = new ActiveXObject('CAPICOM.EnvelopedData');
			try
			{
				EnvelopedData.Algorithm.Name=algorithm;
				EnvelopedData.Algorithm.KeyLength=keyLength;
				EnvelopedData.Content=content;
				EnvelopedData.Recipients.Add(RootCert);
			  return filter(EnvelopedData.Encrypt(CAPICOM_ENCODE_BASE64));
			}
			catch (e)
			{
				alert(e.description);
				return "";
			}
  		// clean up
  		EnvelopedData = null;
		}
		
		function decryptEnvelopedData(content)
		{
    	if (content == "")
    	  return "";
    	  
			// instantiate the CAPICOM objects
			var EnvelopedData = new ActiveXObject('CAPICOM.EnvelopedData');
			try
			{
			  EnvelopedData.Decrypt(content);
			  return EnvelopedData.content;
			}
			catch (e)
			{
				alert(e.description);
				return "";
			}
  		// clean up
  		EnvelopedData = null;
		}
		
    //first sign the Data ,then envelop it,so we can identify the signer
    //param keyLength,algorithm is optional
		function signAndEnvelopData(certificateObj,content,keyLength,algorithm)
		{			
    	return envelopData(signedData(certificateObj,content,CAPICOM_ENCODE_BASE64),keyLength,algorithm);
		}
		
		function filter(src)
		{
			/*
		  var str='';
		  var tmpi=0;
		  for (var i=0;i<src.length;i++){
		    if(src.charAt(i)=='\r'||src.charAt(i)=='\n'){
		      str+=src.substring(tmpi,i);
		      tmpi=i+1;
		    }
		  }str+=src.substring(tmpi,src.length+1);
		  */
		  return src;
		}