	_________________________________________________
	
	ASPACK                 	(C)  Copyright 1998-99 
                       		by Alexey Solodovnikov
	Version 1.08.03 
	14 May 1999

	Web site: http://www.entechtaiwan.com/aspack.htm
	E-mail  : devutils@entechtaiwan.com
	_________________________________________________
	
	Make your software : 

	- smaller
	- faster
	- better    


	D O C U M E N T A T I O N
	_________________________________________________


	CONTENT
	-------

	1. Program description
	2. System Requirements
	3. Installation
	4. Basic use
	5. Options
	6. Uninstallation
        7. Localization 
	8. License
	9. Order   
	A. Technical support



	1. Program description
	~~~~~~~~~~~~~~~~~~~~~~

	ASPack is  an  advanced  Win32  executable file  compressor, 
	capable of reducing the file size of 32-bit Windows programs 
	by as much as 70%. ASPack makes Windows 95/98/NT programs and 
	libraries smaller, and hence faster to both load and download; 
	it also protects  programs  against  reverse  engineering by 
	non-professional hackers. Programs compressed with ASPack are 
	self-contained and run exactly  as before, with no runtime 
	performance penalties.

	Features

	• advanced processing of executable files (exe, dll, ocx) 
	• encoding and compression of program code, data, and resources 
	• completely transparent, self-contained operation with long 
	  filename support 
	• fast decompression routines deliver better performance than 
	  competing products 
	• integrates directly into Windows as a shell extension for 
	  ease of use 
	• full Windows 95, Windows 98 and Windows NT compatibility

	Benefits

	• significant reduction in executable file sizes, averaging 
          from 40-70% 
	• decrease load times across networks, and download times from 
	  the internet 
	• embedded Windows applications require significantly less 
	  storage space 
	• protects resources and code against peeking, disassemblers 
	  and decompilers 
	• no runtime royalties for distributing compressed programs 
	• compatibile with executables created by Microsoft Visual C++, 
	  Visual Basic, Inprise (Borland) Delphi and C++ Builder, and 
	  other Win32 compilers 


	2. System Requirements
	~~~~~~~~~~~~~~~~~~~~~~

	To run ASPack, you need Windows 95/98 or Windows NT. A minimium 
	100MHz Pentium CPU is recommended to compress large files.
  

	3. Installation
	~~~~~~~~~~~~~~~ 

	Simply copy the contents of the distribution package into any 
	directory and run ASPack.exe.

	Note: If you received ASPack on a magazine CD or from some 
	software library, please visit the ASPack home page at 
	http://www.entechtaiwan.com/aspack.htm, 
	to ensure you have the newest version.


	4. Basic use
	~~~~~~~~~~~~

	You can begin compressing applications in any of three 
	ways:

	1. From ASPack - Just run ASPack, and click the "Open" button 
	   to choose any file. After that ASPack automatically goes to 
	   the "Compress" tab and compression begins.

	2. From the Command Line (masks are supported) - Just type:

	   	ASPack c:\MyProject\bigfile.exe 
	   or
		ASPack *.dll       
	   or 
	     	ASPack *.*             
       
   	In the last example ASPack will compress all files with the following 
	extensions: EXE, DLL, OCX, DPL (Delphi DLL), BPL (Delphi DLL).   


	ASPack supports the following commandline parameters:

  	ASPACK  "filename" [options]
                
  	an option may start with either '/' or '-'

	ASPACK supports the following options:

	Options
	-------

 	/H	Show the help message

 	/O	Original file will not be modified. Output goes into
              	output.exe (use /Ooutput.EXE)

 	/R-	The resource section will not get compressed
	/R+	The resource section will get compressed	 

	/B+	Make a backup copy (.BAK file)
	/B-	Don't make a backup copy (.BAK file)

	/E+	Preserve extra data at end of file
	/E-	Don't preserve extra data at end of file	

	/D+	Use Windows imports DLL loader
	/D-	Don't use Windows imports DLL loader
	
	/Q	Be quiet (works without any error messages and exit when done)


	Note: if you don't use any options ASPack take it from Options Tab for 
 	default values. 
	
	Some examples:

	ASPACK c:\MyProject\A*.* /Oc:\MyProject\Release\ /R+ /D+ /B- /Q

	or

	ASPACK Project1.exe /Oc:\MyProject\Project1\Doom.exe /R+ /D+ 	


   	If you want to pack files from any directory, you must place 
	ASPack.exe in your PATH variable. See the autoexec.bat for 
	Windows 95/98, or PATH variable in system options in Windows NT.

	3. From shell extension menu - You can turn on the "Add into 
	context menu" option in the ASPack Options tab, and then 
	choose applicable extensions and press "OK". After this, if you
	right-click on an executable file in Windows Explorer or most 
 	other file managers (like Windows Commander), you will see an 
	additional menu item with the title "Compress with ASPack". 
	Selecting this option will automatically load ASPack, and begin 
	the compression  procedure on the selected file. 
	After compression completes, you can test the compressed file by 
	clicking on the "Test it!" button. 
	If compression failed, an error message will appear and you can 
	restore the original file from the backup copy (.bak extension) 
	by clicking on the "Restore" button, or erase the backup copy if
	the program runs fine (click on the "Erase .BAK" button).
   	Restoring and erasing of the backup copy is available if the 
	"Create backup copy  	(bak-file)" option is turned on in the 
	ASPack Options tab.
         
   	IMPORTANT! - ASPack'ed files cannot be decompressed. Do NOT turn 
	off the "Create backup copy (bak-file)" option if you do not have 
	an original uncompressed copy on hand elsewhere.


	5. Options
	~~~~~~~~~~

	Compress resources 		- Compress resource section 
	Create backup copy (.bak-file) 	- Create backup copy to restore original file
				          (if the compressed application would be failed 
					   after run)
	Auto-open file dialog		- Open the file open dialog immediately 
					  after starting ASPack
	Auto run after loading		- Automatically compress the file after loading
	Exit when done			- Exit ASPack when compression is done
	Use Windows DLL loader 		- There are two ways to load a import DLLs 
					  • by Windows
					  • by build in decompressor 
					  Use build in decompressor import DLL loader for old 
				          Borland C++ linker.	
	Preserve extra data		- Preserve extra data at end of file. This option should
					  be turned on for files which have a overlay data at their 
					  end (installation packages etc)
	Add into context menu 		- Adds ASPack entry into the Windows Explorer context menu 
					  for executable files

	Section's name			- Section name for decompressor data included in the   
			 	 	  compressed PE-image file                               

	Language			- Choose your favorite language


	6. Uninstallation
	~~~~~~~~~~~~~~~~~

	Simply erase the ASPack directory and all files in it.

	IMPORTANT! - If you have enabled the "Add in context menu" option 
	on the ASPack Option tab, be sure to turn this off before removing 
	ASPack from your system.


	7. Localization
	~~~~~~~~~~~~~~~

	This program is "international" and currently supports 15 
	languages (could be selected in the Options tab). 
	Now available: Chinese, Czech, Danish, Dutch, English, French, 
	German,	Italian, Norwegian, Polski, Russian, Slovene, Spanish, 
	Suomi, Swedish.
	If you can help me to implement support for other languages,
	please drop me a line - you'll get a free Personal registration! 
	Please don't send me your language file prior to contacting us,   
	because a new version could be already under development. 
	This is mandatory!    

	8. License
	~~~~~~~~~~

	ASPack is shareware. This means:

	- All copyrights to ASPack are exclusively owned by the author - 
	  Alexey Solodovnikov.
	- Anyone may use this software during a test period of 30 days. 
	  Following this test period of 30 days, if you wish to continue 
	  to use ASPack, you MUST register.
	- Once registered, the user is granted a non-exclusive license to 
	  use ASPack on one computer
  	  (i.e. a single CPU) at a time, for any legal purpose. The 
          registered ASPack software may not be rented or leased, but may 
	  be permanently transferred, if the person receiving it agrees to 
	  the terms of this license. If the software is an update, the 
      	  transfer must include the update and all previous versions. 
	- The ASPack unregistered shareware version may be freely distributed, 
	  provided the distribution package is not modified. No person or 
          company may charge a fee for the distribution of ASPack without 
          written permission from the copyright holder. 
	- ASPACK IS DISTRIBUTED "AS IS". NO WARRANTY OF ANY KIND IS EXPRESSED 
 	  OR IMPLIED. YOU USE THIS SOFTWARE AT YOUR OWN RISK. THE AUTHOR WILL 
	  NOT BE LIABLE FOR DATA LOSS, DAMAGES, LOSS OF PROFITS OR ANY OTHER 
	  KIND OF LOSS WHILE USING OR MISUSING THIS SOFTWARE.
	- You may not use, copy, emulate, clone, rent, lease, sell, modify, 
	  decompile, disassemble, otherwise reverse engineer, or transfer the 
	  licensed program, or any subset of the licensed program, except as 
	  provided for in this agreement. Any such unauthorised use shall 
	  result in immediate and automatic termination of this license and 
	  may result in criminal and/or civil prosecution. All rights not 
	  expressly granted here are reserved by Alexey Solodovnikov.
	- Installing and using ASPack signifies acceptance of the terms and 
	  conditions of this license.
  	  If you do not agree with the terms of this license you must remove 
	  ASPack files from your storage devices and cease to use the product.

	9. How to order
	~~~~~~~~~~~~~~~

	You can register your personal copy of ASPack for US$29. 
	
	There are three types of licences available:
	
	1. Personal ($29) - one computer licence for private use or
	freeware authors who want to distribute programs in the
     	compressed form.

  	2. Shareware Author ($49) - one computer licence for single
     	shareware authors who want to distribute programs in the
     	compressed form.

  	3. Software Developer ($179) - site licence for software companies
     	and programmer team.

	Quick order
	-----------
	Connect to the internet.
	Run ASPack, open the "About" tab and click the "Click here for 
	on-line registration" label, which will take you to an on-line 
	registration service site. 

	Additional info
	---------------
	You can select one of the following ways to register:

	1. Through the World Wide Web. This is the fastest and easiest way to 
	register. The ordering page is secure, ensuring that your confidential 
	information remains confidential. For details 
	on ordering ASPack through the Web, please go to the site at:

	http://www.entechtaiwan.com/aspack_reg.htm

	Or, you can go directly to the order page:
 	
	https://www.regsoft.com/cgi-bin/reg_it_offsite.pl?9054	(Personal  licence)
	https://www.regsoft.com/cgi-bin/reg_it_offsite.pl?10628	(Shareware licence)
	https://www.regsoft.com/cgi-bin/reg_it_offsite.pl?10629	(Site	   licence)

	2. Voice and fax orders - Individual licenses may also be ordered by 
	voice or fax as an alternative to on-line ordering. US customers can 
	call toll-free at 1-888-REG-IT-80 to place an order by voice; 
	international customers can call 770-497-9126. Fax orders may be made 
	to 770-497-9234. When placing your order, please refer to the following 
	oroduct ID: 
        
	ID - 9054  	(Personal  licence)
	ID - 10628	(Shareware licence)
	ID - 10629	(Site	   licence)


	A. Technical support
	~~~~~~~~~~~~~~~~~~~~

	Technical support is available by e-mail addressed to Alexey Solodovnikov 
	at

	devutils@entechtaiwan.com

	I will try to reply to all messages but only registered users can expect 
	a quick answer. 
        
	Please include the following information when requesting support:

	- program version (from "About" dialog)
	- registred name (if you're a registered user)
	- where did you get ASPack from (http or ftp site). 
	- Windows 95/98/NT version (including service packs and other fixes 
	  installed)
	- full description of your problem - provide as much information 
	  as possible to allow duplication of the problem: place of error, 
	  sequence of your actions, etc.
	- files causing problems may be submitted in one of two ways:
	  * by e-mail attachment, but only if less than 1MB in size
	  * by URL
  	  all files must be compressed in .zip format and must not be 
	  compressed by ASPack.

	Note: before requesting technical support, please ensure that you 
	are using the latest version of ASPack available from 
	
	http://www.entechtaiwan.com/aspack.htm
	 
	_________________________________________________
