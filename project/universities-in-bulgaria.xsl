<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="xml" version="1.0" indent="yes"/>
<xsl:template match="/">
<fo:root>
    <fo:layout-master-set>
        <fo:simple-page-master 
            page-height="297mm"  page-width="210mm"
            margin="5mm 25mm 5mm 25mm" 
            master-name="unicatalog">
            <fo:region-body margin="20mm 0mm 20mm 0mm"/>
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
                    <fo:external-graphic src="url('images/bulgaria.jpg')" margin-left="5cm" margin-bottom="15mm"></fo:external-graphic>
                </fo:block>
            </fo:block-container>
        </fo:flow>
    </fo:page-sequence>
		
    <!-- for each university do 3 pages -->
    <!-- 1st page : 
        picture 
        details
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
    <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
            <fo:block-container position ="absolute" top="-2.5cm" left = "-2.5cm">
                <fo:block position="absolute" text-align = "center" padding-before = "12mm" margin-left="2cm" font-family="Monotype Corsiva" font-size="40pt" color="black">
                    <xsl:value-of select="//hotel[@hotelID='ATLASGS']/hotel_name"/>
                </fo:block>
                
                <fo:block position="absolute" text-align = "center" padding-before = "10mm" margin-left="2cm">
                    <xsl:apply-templates select="//hotel[@hotelID='ATLASGS']/image/src"/>
                </fo:block>
                
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="10mm" margin-left="2cm">
                    Хотелска верига: 
                    <fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//chain[@chainID='A']/chain_name"/> 
                    </fo:inline>
                </fo:block> 
                
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Тип хотел: 
                    <fo:inline position="relative" padding-left="25mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//hotel[@hotelID='ATLASGS']/hotel_type"/> 
                    </fo:inline>
                </fo:block> 
                
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Категория: 
                    <fo:inline position="relative" padding-left="25mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//hotel[@hotelID='ATLASGS']/category"/> 
                    </fo:inline>
                </fo:block> 

                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Описание: 
                </fo:block> 
                
                <fo:block position="relative" font-family="Arial"  font-size="14pt" color="black" start-indent ="5mm" end-indent="5mm" padding-before="0mm" margin-left="2.5cm" text-align = "justify">
                    <xsl:value-of select="//hotel[@hotelID='ATLASGS']/description"/> 
                </fo:block> 
                
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Адрес:
                    <fo:inline position="relative" padding-left="10mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//hotel[@hotelID='ATLASGS']/address"/> 
                    </fo:inline>
                </fo:block> 
                
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Телефон:
                    <fo:inline position="relative" padding-left="5mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//hotel[@hotelID='ATLASGS']/phone"/> 
                    </fo:inline>
                </fo:block> 
                
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Email:
                    <fo:inline position="relative" padding-left="15mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//hotel[@hotelID='ATLASGS']/email"/> 
                    </fo:inline>
                </fo:block> 
                
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="15pt" color="black" 
                padding-before="5mm" margin-left="2cm">
                    Web Site:
                    <fo:inline position="relative" padding-left="8mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="//hotel[@hotelID='ATLASGS']/site"/> 
                    </fo:inline>
                </fo:block> 
            </fo:block-container>
        </fo:flow>
    </fo:page-sequence>

    <!-- sofia university 2 part -->
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

    <!-- sofia uviversity 3 part -->
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
    </fo:page-sequence>

</fo-root>