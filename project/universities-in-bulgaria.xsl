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
            <fo:block-container position ="absolute" top="-2.5cm" left = "-2.5cm" >
                <fo:block position ="absolute" text-align ="center" font-weight="bold" margin-left="2cm"
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
        //university[@univId='uni1']/univDetails/name
        picture 
        year founded
        contacts
    -->
    <!-- 2nd page : 
        programs accreditation as table?    
    -->
    <!-- 3rd page : 
        faculties
        branches
        departments
    -->

    <!-- sofia university part 1 -->		
    <fo:page-sequence master-reference="unicatalog">
        <fo:flow flow-name="xsl-region-body">
            <fo:block-container position ="absolute" top="-2.5cm" left = "-2.5cm">
                <!-- uni name -->
                <fo:block position="absolute" text-align = "center" padding-before = "12mm" margin-left="2cm" 
                            font-family="Monotype Corsiva" font-size="40pt" color="black">
                    <xsl:value-of select="//university[@univId='uni1']/univDetails/name"></xsl:value-of>
                </fo:block>
                
                <!-- uni picture -->
                <fo:block position="absolute" text-align = "center" padding-before = "10mm" margin-left="2cm">
                    <xsl:apply-templates select="//university[@univId='uni1']/univDetails/univImage/src"></xsl:apply-templates>
                </fo:block>
                
                <!-- year founded -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Основан през : 
                    <fo:inline position="relative" padding-left="11mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//university[@univId='uni1']/univDetails/yearFounded"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 
                
                <!-- rector -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Ректор : 
                    <fo:inline position="relative" padding-left="30mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//university[@univId='uni1']/univDetails/rectorName"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 
                
                <!-- number of students -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Брой студенти : 
                    <fo:inline position="relative" padding-left="9mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//university[@univId='uni1']/univDetails/numberOfStudents"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 

                <!-- location -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Адрес :  
                    <fo:inline position="relative" padding-left="31mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//university[@univId='uni1']/univContacts/location/city"></xsl:value-of> 
                    </fo:inline>
                    <fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//university[@univId='uni1']/univContacts/location/street"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 
                
                <!-- phone -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Телефон : 
                    <fo:inline position="relative" padding-left="24mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//university[@univId='uni1']/univContacts/phone"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 

                <!-- web site -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Уеб сайт : 
                    <fo:inline position="relative" padding-left="25mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//university[@univId='uni1']/univContacts/webSite/@href"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 

                <!-- email -->
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Имейл : 
                    <fo:inline position="relative" padding-left="30mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//university[@univId='uni1']/univContacts/email/@mailAddress"></xsl:value-of> 
                    </fo:inline>
                </fo:block> 
            </fo:block-container>
        </fo:flow>
    </fo:page-sequence>
<!-- 
    sofia university 2 part
    <fo:page-sequence master-reference="page">
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
    </fo:page-sequence>

    sofia uviversity 3 part
    <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
            <fo:block-container position ="absolute" top="-2.5cm" left = "-2.5cm">					
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="13pt" color="black" 
                padding-before="12mm" padding-after="5mm" margin-left="2cm">
                    Допълнителна полезна информация за <xsl:value-of select="//hotel[@hotelID='ATLASGS']/hotel_name"/>: 
                </fo:block> 
                
                <fo:block position="relative" font-family="Arial"  font-size="14pt" color="black" start-indent ="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align = "justify">
                    <xsl:apply-templates select="//hotel[@hotelID='ATLASGS']/more_info"/> 
                </fo:block> 
                
            </fo:block-container>
        </fo:flow>
    </fo:page-sequence> -->


</fo:root>
</xsl:template>


<!-- template for images -->
<xsl:template match="src">
	<fo:external-graphic src="{unparsed-entity-uri(@href)}" content-height="250" content-width="350"/>
</xsl:template>

</xsl:stylesheet>