<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="xml" version="1.0" indent="yes"/>

<xsl:template match="/">
<fo:root>
    <fo:layout-master-set>
        <fo:simple-page-master 
            page-height="297mm" page-width="210mm" margin="5mm 25mm 5mm 25mm" master-name="unicatalog">
            <fo:region-body margin="20mm 0mm 20mm 0mm"></fo:region-body>
        </fo:simple-page-master>
    </fo:layout-master-set>

    <!-- header page -->
    <fo:page-sequence master-reference="unicatalog">
        <fo:flow flow-name="xsl-region-body">
            <fo:block-container position ="absolute" top="-2.5cm" left="-2.5cm" >
                <fo:block position="absolute" text-align="center" font-weight="bold" margin-left="2cm"
                font-family="Monotype Corsiva" font-size="48pt" padding-before="50mm" color="black" >
                    <fo:block margin-bottom="50mm">
                        Каталог на университетите в България
                    </fo:block>
                    <!-- <fo:external-graphic src="url('images/bulgaria.jpg')" margin-left="5cm" margin-bottom="15mm"></fo:external-graphic> -->
                </fo:block>
            </fo:block-container>
        </fo:flow>
    </fo:page-sequence>
		
    <!-- for each university do 3 pages -->
    <!-- 1st page : 
        name
        picture 
        year founded
        rector
        # students
        location
        phone
        email
    -->
    <!-- 2nd page : 
        faculties
        branches - if present
        departments - if present
    -->
    <!-- 3rd page : 
        programs accreditation as table?   
    -->

    <!-- university 1st page -->
    <xsl:for-each select="//university">
    <fo:page-sequence master-reference="unicatalog">
        <fo:flow flow-name="xsl-region-body">
            <fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">
                <!-- uni name -->
                <fo:block position="absolute" text-align="center" padding-before="12mm" margin-left="2cm" 
                            font-family="Monotype Corsiva" font-size="40pt" color="black">
                    <xsl:value-of select="./univDetails/name"></xsl:value-of>
                </fo:block>
                
                <!-- uni picture -->
                <fo:block position="absolute" text-align="center" padding-before="10mm" margin-left="2cm">
                    <xsl:apply-templates select="./univDetails/univImage/src"></xsl:apply-templates>
                </fo:block>
                
                <!-- year founded -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Основан през : 
                    <fo:inline position="relative" padding-left="11mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="./univDetails/yearFounded"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 
                
                <!-- rector -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Ректор : 
                    <fo:inline position="relative" padding-left="30mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="./univDetails/rectorName"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 
                
                <!-- number of students -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Брой студенти : 
                    <fo:inline position="relative" padding-left="9mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="./univDetails/numberOfStudents"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 

                <!-- location -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Адрес :  
                    <fo:inline position="relative" padding-left="31mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="./univContacts/location/city"></xsl:value-of> 
                    </fo:inline>
                    <fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="./univContacts/location/street"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 
                
                <!-- phone -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Телефон : 
                    <fo:inline position="relative" padding-left="24mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="./univContacts/phone"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 

                <!-- web site -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Уеб сайт : 
                    <fo:inline position="relative" padding-left="25mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="./univContacts/webSite/@href"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 

                <!-- email -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Имейл : 
                    <fo:inline position="relative" padding-left="30mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="./univContacts/email/@mailAddress"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 
            </fo:block-container>
        </fo:flow>
    </fo:page-sequence>

    <!-- uviversity 2nd page -->
    <fo:page-sequence master-reference="unicatalog">
        <fo:flow flow-name="xsl-region-body">
            <fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">

                <!-- page header -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="16pt" color="black" 
                padding-before="5mm" padding-after="5mm" margin-left="1cm">
                    Структура на <xsl:value-of select="./univDetails/name"></xsl:value-of>
                </fo:block> 
                
                <!-- faculties -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="14pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Факултети : 
                </fo:block> 
                <fo:block position="relative" start-indent="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align="justify">
                    <xsl:apply-templates select="./listOfFaculties"></xsl:apply-templates> 
                </fo:block>
                
                <!-- branches -->
                <xsl:if test="./listOfBranches">
                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="14pt" color="black" 
                    padding-before="5mm" margin-left="2cm">
                        Филиали : 
                    </fo:block> 
                    <fo:block position="relative" start-indent="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align="justify">
                        <xsl:apply-templates select="./listOfBranches"></xsl:apply-templates> 
                    </fo:block>
                </xsl:if>

                <!-- departments -->
                <xsl:if test="./listOfDepartments">
                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="14pt" color="black" 
                    padding-before="5mm" margin-left="2cm">
                        Департаменти : 
                    </fo:block>
                    <fo:block position="relative" start-indent="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align="justify">
                        <xsl:apply-templates select="./listOfDepartments"></xsl:apply-templates> 
                    </fo:block>
                </xsl:if>

            </fo:block-container>
        </fo:flow>
    </fo:page-sequence>

    </xsl:for-each>


    <!-- university 3rd page -->
    <!-- <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
            <fo:block-container position ="absolute" top="-2.5cm" left = "-2.5cm">					
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="12mm" margin-left="2cm">
                    Стаи: 
                </fo:block> 
                
                <fo:block position="relative" font-family="Arial"  font-size="14pt" color="black" start-indent ="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align = "justify">
                    <xsl:value-of select="//hotel[@hotelID='ATLASGS']/rooms/rooms_description"/> 
                </fo:block> 
                
                <fo:block position="absolute" text-align = "center" padding-before = "5mm" padding-after = "5mm" margin-left="2cm">
                    <xsl:apply-templates select="//hotel[@hotelID='ATLASGS']/rooms/rooms_images/room_image[@type='1']/image_src"/>
                    <fo:inline position="relative" padding-left="0mm">
                        <xsl:apply-templates select="//hotel[@hotelID='ATLASGS']/rooms/rooms_images/room_image[@type='2']/image_src"/>
                    </fo:inline>
                </fo:block>
                
                <fo:block position="absolute" font-family="Arial" color="black" padding-before="0mm">
                    <xsl:apply-templates select="//hotel[@hotelID='ATLASGS']/rooms"/>
                </fo:block>
                
            </fo:block-container>
        </fo:flow>
    </fo:page-sequence> -->


</fo:root>
</xsl:template>


<!-- template for images -->
<xsl:template match="src">
	<fo:external-graphic src="{unparsed-entity-uri(@href)}" content-height="350" content-width="490"></fo:external-graphic>
</xsl:template>

<!-- template for university faculties -->
<xsl:template match="listOfFaculties">
	<xsl:for-each select="./faculty">
		<fo:block position="relative" font-family="Arial"  font-size="12pt" color="black" 
        start-indent ="30mm" end-indent="5mm" padding-before="0mm" font-weight="normal" margin-left="0.5cm">
			-<xsl:value-of select="text()"></xsl:value-of>
		</fo:block>		
	</xsl:for-each>
</xsl:template>

<!-- template for university branches -->
<xsl:template match="listOfBranches">
	<xsl:for-each select="./branch">
		<fo:block position="relative" font-family="Arial"  font-size="12pt" color="black" 
        start-indent ="30mm" end-indent="5mm" padding-before="0mm" font-weight="normal" margin-left="0.5cm">
			-<xsl:value-of select="text()"></xsl:value-of>
		</fo:block>		
	</xsl:for-each>
</xsl:template>

<!-- template for university departmetns -->
<xsl:template match="listOfDepartments">
	<xsl:for-each select="./department">
		<fo:block position="relative" font-family="Arial"  font-size="12pt" color="black" 
        start-indent ="30mm" end-indent="5mm" padding-before="0mm" font-weight="normal" margin-left="0.5cm">
			-<xsl:value-of select="text()"></xsl:value-of>
		</fo:block>		
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>