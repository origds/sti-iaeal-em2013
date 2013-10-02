<%-- 
    Document   : busqueda
    Created on : Nov 15, 2012, 5:05:30 PM
    Author     : matteo
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>
<script>
    $(document).ready(function() {
        $("#periodo1").hide();
        $("#periodo2").hide();

        $("#botonAnio").click(function() {

            if ($("#anioFirma").is(":visible"))
                return true;

            $("#anio").val("");
            $("#ini").val("");
            $("#fin").val("");

            $("#anioFirma").show();
            $("#periodo1").hide();
            $("#periodo2").hide();
        });

        $("#botonPeriodo").click(function() {


            if ($("#periodo1").is(":visible"))
                return true;

            $("#anio").val("");
            $("#ini").val("");
            $("#fin").val("");

            $("#anioFirma").hide();
            $("#periodo1").show();
            $("#periodo2").show();
        });
    });
</script>

<style>
    .error{font-size: 10px;color: #cc0000; float:left; padding:0}
    .error ul{list-style: none;}
</style>

<logic:present name="fecha">
    <logic:equal name="fecha" value="fechaErrada">
        <script>
            $(document).ready(function() {
                alert("La fecha de inicio debe ser menor a la fecha de finalizacion");
            });
        </script>
    </logic:equal>
</logic:present>

<div id="body">
    <div id="barraBusqueda">
        <div class="box"> 
            <div class="inbox" style="height:550px;" id="cajaBusqueda">
                <br>
                <div class="titulo">Búsqueda</div>
                <html:form action="/buscar" acceptCharset="ISO-8859-1">
                    <table style="width:400px; padding-top: 20px">
                        <tr>
                            <td colspan="2">
                                <fieldset style="border:none;">
                                    <div class="error">
                                        <html:errors property="claves"/>
                                    </div>
                                    <legend>Palabras Claves (Contenidas en el título) </legend>
                                    <html:text property="claves"/>
                                </fieldset>
                            </td>
                        </tr>                       
                    </table>
                    <table>
                        <tr>
                            <td colspan="2">
                        <center>
                            <html:submit value= "Buscar" />
                        </center>
                        </tr>
                    </table>
                    <br><br>
                    <fieldset style="border:none; border-top: 2px solid #00627A; width: 520px;">
                        <table style="width: 420px; padding-top: 20px;">
                            <tr>

                                <td>
                                    <div class="titulo" style="margin-top: 5px;">Avanzada</div>
                                </td>
                                <td>
                                    Tipo de Usuario:
                                    <html:select property="tipoUsuario"> <!--hola oriana-->
                                <option>Estudiante</option>
                                <option>Profesor</option>
                                <option>Otro</option>
                            </html:select> 
                            </right>
                            </td>

                            </tr>
                            <right>

                                <td colspan="2">  

                                    <br>
                                    <br>
                                    <fieldset style="border:none;">

                                        <legend>
                                            <center>
                                            País (Se deben separar los paises por comas. Ejemplo: Venezuela, Colombia)
                                            </center>
                                        </legend>
                                        
                                        <div class="error">
                                            <html:errors property="pais"/>
                                        </div>
                                        <html:text property="pais"/>
                                    </fieldset>
                                </td>
                                </tr>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    <div id="botonAnio" class="botonBusqueda">Incluir Año de Firma</div>
                                </td>
                                <td>
                                    <div id="botonPeriodo" class="botonBusqueda">Incluir Varios Años</div>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 400px;">
                            <tr>
                                <td colspan="2">
                            <center>
                                <div id="anioFirma">
                                    <fieldset style="border:none;">
                                        <legend>Año de Firma</legend>
                                        <html:select property="anio">
                                            <option>  </option>
                                            <option> 1820 </option>
                                            <option> 1821 </option>
                                            <option> 1822 </option>
                                            <option> 1823 </option>
                                            <option> 1824 </option>
                                            <option> 1825 </option>
                                            <option> 1826 </option>
                                            <option> 1827 </option>
                                            <option> 1828 </option>
                                            <option> 1829 </option>
                                            <option> 1830 </option>
                                            <option> 1831 </option>
                                            <option> 1832 </option>
                                            <option> 1833 </option>
                                            <option> 1834 </option>
                                            <option> 1835 </option>
                                            <option> 1836 </option>
                                            <option> 1837 </option>
                                            <option> 1838 </option>
                                            <option> 1839 </option>
                                            <option> 1840 </option>
                                            <option> 1841 </option>
                                            <option> 1842 </option>
                                            <option> 1843 </option>
                                            <option> 1844 </option>
                                            <option> 1845 </option>
                                            <option> 1846 </option>
                                            <option> 1847 </option>
                                            <option> 1848 </option>
                                            <option> 1849 </option>
                                            <option> 1850 </option>
                                            <option> 1851 </option>
                                            <option> 1852 </option>
                                            <option> 1853 </option>
                                            <option> 1854 </option>
                                            <option> 1855 </option>
                                            <option> 1856 </option>
                                            <option> 1857 </option>
                                            <option> 1858 </option>
                                            <option> 1859 </option>
                                            <option> 1860 </option>
                                            <option> 1861 </option>
                                            <option> 1862 </option>
                                            <option> 1863 </option>
                                            <option> 1864 </option>
                                            <option> 1865 </option>
                                            <option> 1866 </option>
                                            <option> 1867 </option>
                                            <option> 1868 </option>
                                            <option> 1869 </option>
                                            <option> 1870 </option>
                                            <option> 1871 </option>
                                            <option> 1872 </option>
                                            <option> 1873 </option>
                                            <option> 1874 </option>
                                            <option> 1875 </option>
                                            <option> 1876 </option>
                                            <option> 1877 </option>
                                            <option> 1878 </option>
                                            <option> 1879 </option>
                                            <option> 1880 </option>
                                            <option> 1881 </option>
                                            <option> 1882 </option>
                                            <option> 1883 </option>
                                            <option> 1884 </option>
                                            <option> 1885 </option>
                                            <option> 1886 </option>
                                            <option> 1887 </option>
                                            <option> 1888 </option>
                                            <option> 1889 </option>
                                            <option> 1890 </option>
                                            <option> 1891 </option>
                                            <option> 1892 </option>
                                            <option> 1893 </option>
                                            <option> 1894 </option>
                                            <option> 1895 </option>
                                            <option> 1896 </option>
                                            <option> 1897 </option>
                                            <option> 1898 </option>
                                            <option> 1899 </option>
                                            <option> 1900 </option>
                                            <option> 1901 </option>
                                            <option> 1902 </option>
                                            <option> 1903 </option>
                                            <option> 1904 </option>
                                            <option> 1905 </option>
                                            <option> 1906 </option>
                                            <option> 1907 </option>
                                            <option> 1908 </option>
                                            <option> 1909 </option>
                                            <option> 1910 </option>
                                            <option> 1911 </option>
                                            <option> 1913 </option>
                                            <option> 1914 </option>
                                            <option> 1915 </option>
                                            <option> 1916 </option>
                                            <option> 1917 </option>
                                            <option> 1918 </option>
                                            <option> 1919 </option>
                                            <option> 1920 </option>
                                            <option> 1921 </option>
                                            <option> 1922 </option>
                                            <option> 1923 </option>
                                            <option> 1924 </option>
                                            <option> 1925 </option>
                                            <option> 1926 </option>
                                            <option> 1927 </option>
                                            <option> 1928 </option>
                                            <option> 1929 </option>
                                            <option> 1930 </option>
                                            <option> 1931 </option>
                                            <option> 1932 </option>
                                            <option> 1933 </option>
                                            <option> 1934 </option>
                                            <option> 1935 </option>
                                            <option> 1936 </option>
                                            <option> 1937 </option>
                                            <option> 1938 </option>
                                            <option> 1939 </option>
                                            <option> 1940 </option>
                                            <option> 1941 </option>
                                            <option> 1942 </option>
                                            <option> 1943 </option>
                                            <option> 1944 </option>
                                            <option> 1945 </option>
                                            <option> 1946 </option>
                                            <option> 1947 </option>
                                            <option> 1948 </option>
                                            <option> 1949 </option>
                                            <option> 1950 </option>
                                            <option> 1951 </option>
                                            <option> 1952 </option>
                                            <option> 1953 </option>
                                            <option> 1954 </option>
                                            <option> 1955 </option>
                                            <option> 1956 </option>
                                            <option> 1957 </option>
                                            <option> 1958 </option>
                                            <option> 1959 </option>
                                            <option> 1960 </option>
                                            <option> 1961 </option>
                                            <option> 1962 </option>
                                            <option> 1963 </option>
                                            <option> 1964 </option>
                                            <option> 1965 </option>
                                            <option> 1966 </option>
                                            <option> 1967 </option>
                                            <option> 1968 </option>
                                            <option> 1969 </option>
                                            <option> 1970 </option>
                                            <option> 1971 </option>
                                            <option> 1972 </option>
                                            <option> 1973 </option>
                                            <option> 1974 </option>
                                            <option> 1975 </option>
                                            <option> 1976 </option>
                                            <option> 1977 </option>
                                            <option> 1978 </option>
                                            <option> 1979 </option>
                                            <option> 1980 </option>
                                            <option> 1981 </option>
                                            <option> 1982 </option>
                                            <option> 1983 </option>
                                            <option> 1984 </option>
                                            <option> 1985 </option>
                                            <option> 1986 </option>
                                            <option> 1987 </option>
                                            <option> 1988 </option>
                                            <option> 1989 </option>
                                            <option> 1990 </option>
                                            <option> 1991 </option>
                                            <option> 1992 </option>
                                            <option> 1993 </option>
                                            <option> 1994 </option>
                                            <option> 1995 </option>
                                            <option> 1996 </option>
                                            <option> 1997 </option>
                                            <option> 1998 </option>
                                            <option> 1999 </option>
                                            <option> 2000 </option>
                                            <option> 2001 </option>
                                            <option> 2002 </option>
                                            <option> 2003 </option>
                                            <option> 2004</option>
                                            <option> 2005 </option>
                                            <option> 2006 </option>
                                            <option> 2007 </option>
                                            <option> 2008 </option>
                                            <option> 2009 </option>
                                            <option> 2010 </option>
                                            <option> 2011 </option>
                                            <option> 2012 </option>
                                            <option> 2013 </option>
                                        </html:select>   
                                        <div class="error">
                                            <html:errors property="anio"/>
                                        </div>
                                    </fieldset>
                                </div>
                            </center>
                            </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="periodo1">
                                        <fieldset style="border:none;">
                                            <legend>Inicio de período</legend>                  
                                            <!-- <input type ="text" class="anioBusqueda" name="fechaini" id="ini"/> -->
                                            <html:select property="fechaini">
                                                <option>  </option>
                                                <option> 1820 </option>
                                                <option> 1821 </option>
                                                <option> 1822 </option>
                                                <option> 1823 </option>
                                                <option> 1824 </option>
                                                <option> 1825 </option>
                                                <option> 1826 </option>
                                                <option> 1827 </option>
                                                <option> 1828 </option>
                                                <option> 1829 </option>
                                                <option> 1830 </option>
                                                <option> 1831 </option>
                                                <option> 1832 </option>
                                                <option> 1833 </option>
                                                <option> 1834 </option>
                                                <option> 1835 </option>
                                                <option> 1836 </option>
                                                <option> 1837 </option>
                                                <option> 1838 </option>
                                                <option> 1839 </option>
                                                <option> 1840 </option>
                                                <option> 1841 </option>
                                                <option> 1842 </option>
                                                <option> 1843 </option>
                                                <option> 1844 </option>
                                                <option> 1845 </option>
                                                <option> 1846 </option>
                                                <option> 1847 </option>
                                                <option> 1848 </option>
                                                <option> 1849 </option>
                                                <option> 1850 </option>
                                                <option> 1851 </option>
                                                <option> 1852 </option>
                                                <option> 1853 </option>
                                                <option> 1854 </option>
                                                <option> 1855 </option>
                                                <option> 1856 </option>
                                                <option> 1857 </option>
                                                <option> 1858 </option>
                                                <option> 1859 </option>
                                                <option> 1860 </option>
                                                <option> 1861 </option>
                                                <option> 1862 </option>
                                                <option> 1863 </option>
                                                <option> 1864 </option>
                                                <option> 1865 </option>
                                                <option> 1866 </option>
                                                <option> 1867 </option>
                                                <option> 1868 </option>
                                                <option> 1869 </option>
                                                <option> 1870 </option>
                                                <option> 1871 </option>
                                                <option> 1872 </option>
                                                <option> 1873 </option>
                                                <option> 1874 </option>
                                                <option> 1875 </option>
                                                <option> 1876 </option>
                                                <option> 1877 </option>
                                                <option> 1878 </option>
                                                <option> 1879 </option>
                                                <option> 1880 </option>
                                                <option> 1881 </option>
                                                <option> 1882 </option>
                                                <option> 1883 </option>
                                                <option> 1884 </option>
                                                <option> 1885 </option>
                                                <option> 1886 </option>
                                                <option> 1887 </option>
                                                <option> 1888 </option>
                                                <option> 1889 </option>
                                                <option> 1890 </option>
                                                <option> 1891 </option>
                                                <option> 1892 </option>
                                                <option> 1893 </option>
                                                <option> 1894 </option>
                                                <option> 1895 </option>
                                                <option> 1896 </option>
                                                <option> 1897 </option>
                                                <option> 1898 </option>
                                                <option> 1899 </option>
                                                <option> 1900 </option>
                                                <option> 1901 </option>
                                                <option> 1902 </option>
                                                <option> 1903 </option>
                                                <option> 1904 </option>
                                                <option> 1905 </option>
                                                <option> 1906 </option>
                                                <option> 1907 </option>
                                                <option> 1908 </option>
                                                <option> 1909 </option>
                                                <option> 1910 </option>
                                                <option> 1911 </option>
                                                <option> 1913 </option>
                                                <option> 1914 </option>
                                                <option> 1915 </option>
                                                <option> 1916 </option>
                                                <option> 1917 </option>
                                                <option> 1918 </option>
                                                <option> 1919 </option>
                                                <option> 1920 </option>
                                                <option> 1921 </option>
                                                <option> 1922 </option>
                                                <option> 1923 </option>
                                                <option> 1924 </option>
                                                <option> 1925 </option>
                                                <option> 1926 </option>
                                                <option> 1927 </option>
                                                <option> 1928 </option>
                                                <option> 1929 </option>
                                                <option> 1930 </option>
                                                <option> 1931 </option>
                                                <option> 1932 </option>
                                                <option> 1933 </option>
                                                <option> 1934 </option>
                                                <option> 1935 </option>
                                                <option> 1936 </option>
                                                <option> 1937 </option>
                                                <option> 1938 </option>
                                                <option> 1939 </option>
                                                <option> 1940 </option>
                                                <option> 1941 </option>
                                                <option> 1942 </option>
                                                <option> 1943 </option>
                                                <option> 1944 </option>
                                                <option> 1945 </option>
                                                <option> 1946 </option>
                                                <option> 1947 </option>
                                                <option> 1948 </option>
                                                <option> 1949 </option>
                                                <option> 1950 </option>
                                                <option> 1951 </option>
                                                <option> 1952 </option>
                                                <option> 1953 </option>
                                                <option> 1954 </option>
                                                <option> 1955 </option>
                                                <option> 1956 </option>
                                                <option> 1957 </option>
                                                <option> 1958 </option>
                                                <option> 1959 </option>
                                                <option> 1960 </option>
                                                <option> 1961 </option>
                                                <option> 1962 </option>
                                                <option> 1963 </option>
                                                <option> 1964 </option>
                                                <option> 1965 </option>
                                                <option> 1966 </option>
                                                <option> 1967 </option>
                                                <option> 1968 </option>
                                                <option> 1969 </option>
                                                <option> 1970 </option>
                                                <option> 1971 </option>
                                                <option> 1972 </option>
                                                <option> 1973 </option>
                                                <option> 1974 </option>
                                                <option> 1975 </option>
                                                <option> 1976 </option>
                                                <option> 1977 </option>
                                                <option> 1978 </option>
                                                <option> 1979 </option>
                                                <option> 1980 </option>
                                                <option> 1981 </option>
                                                <option> 1982 </option>
                                                <option> 1983 </option>
                                                <option> 1984 </option>
                                                <option> 1985 </option>
                                                <option> 1986 </option>
                                                <option> 1987 </option>
                                                <option> 1988 </option>
                                                <option> 1989 </option>
                                                <option> 1990 </option>
                                                <option> 1991 </option>
                                                <option> 1992 </option>
                                                <option> 1993 </option>
                                                <option> 1994 </option>
                                                <option> 1995 </option>
                                                <option> 1996 </option>
                                                <option> 1997 </option>
                                                <option> 1998 </option>
                                                <option> 1999 </option>
                                                <option> 2000 </option>
                                                <option> 2001 </option>
                                                <option> 2002 </option>
                                                <option> 2003 </option>
                                                <option> 2004</option>
                                                <option> 2005 </option>
                                                <option> 2006 </option>
                                                <option> 2007 </option>
                                                <option> 2008 </option>
                                                <option> 2009 </option>
                                                <option> 2010 </option>
                                                <option> 2011 </option>
                                                <option> 2012 </option>
                                                <option> 2013 </option>
                                            </html:select>   
                                            <div class="error">
                                                <html:errors property="fechaini"/>
                                            </div>  
                                        </fieldset>
                                    </div>
                                </td>
                                <td>
                                    <div id="periodo2">
                                        <fieldset style="border:none;">
                                            <legend>Finalización de período</legend>
                                            <!--  <input type ="text" class="anioBusqueda" name="fechafin" id="fin"/>-->
                                            <html:select property="fechafin">
                                                <option>  </option>
                                                <option> 1820 </option>
                                                <option> 1821 </option>
                                                <option> 1822 </option>
                                                <option> 1823 </option>
                                                <option> 1824 </option>
                                                <option> 1825 </option>
                                                <option> 1826 </option>
                                                <option> 1827 </option>
                                                <option> 1828 </option>
                                                <option> 1829 </option>
                                                <option> 1830 </option>
                                                <option> 1831 </option>
                                                <option> 1832 </option>
                                                <option> 1833 </option>
                                                <option> 1834 </option>
                                                <option> 1835 </option>
                                                <option> 1836 </option>
                                                <option> 1837 </option>
                                                <option> 1838 </option>
                                                <option> 1839 </option>
                                                <option> 1840 </option>
                                                <option> 1841 </option>
                                                <option> 1842 </option>
                                                <option> 1843 </option>
                                                <option> 1844 </option>
                                                <option> 1845 </option>
                                                <option> 1846 </option>
                                                <option> 1847 </option>
                                                <option> 1848 </option>
                                                <option> 1849 </option>
                                                <option> 1850 </option>
                                                <option> 1851 </option>
                                                <option> 1852 </option>
                                                <option> 1853 </option>
                                                <option> 1854 </option>
                                                <option> 1855 </option>
                                                <option> 1856 </option>
                                                <option> 1857 </option>
                                                <option> 1858 </option>
                                                <option> 1859 </option>
                                                <option> 1860 </option>
                                                <option> 1861 </option>
                                                <option> 1862 </option>
                                                <option> 1863 </option>
                                                <option> 1864 </option>
                                                <option> 1865 </option>
                                                <option> 1866 </option>
                                                <option> 1867 </option>
                                                <option> 1868 </option>
                                                <option> 1869 </option>
                                                <option> 1870 </option>
                                                <option> 1871 </option>
                                                <option> 1872 </option>
                                                <option> 1873 </option>
                                                <option> 1874 </option>
                                                <option> 1875 </option>
                                                <option> 1876 </option>
                                                <option> 1877 </option>
                                                <option> 1878 </option>
                                                <option> 1879 </option>
                                                <option> 1880 </option>
                                                <option> 1881 </option>
                                                <option> 1882 </option>
                                                <option> 1883 </option>
                                                <option> 1884 </option>
                                                <option> 1885 </option>
                                                <option> 1886 </option>
                                                <option> 1887 </option>
                                                <option> 1888 </option>
                                                <option> 1889 </option>
                                                <option> 1890 </option>
                                                <option> 1891 </option>
                                                <option> 1892 </option>
                                                <option> 1893 </option>
                                                <option> 1894 </option>
                                                <option> 1895 </option>
                                                <option> 1896 </option>
                                                <option> 1897 </option>
                                                <option> 1898 </option>
                                                <option> 1899 </option>
                                                <option> 1900 </option>
                                                <option> 1901 </option>
                                                <option> 1902 </option>
                                                <option> 1903 </option>
                                                <option> 1904 </option>
                                                <option> 1905 </option>
                                                <option> 1906 </option>
                                                <option> 1907 </option>
                                                <option> 1908 </option>
                                                <option> 1909 </option>
                                                <option> 1910 </option>
                                                <option> 1911 </option>
                                                <option> 1913 </option>
                                                <option> 1914 </option>
                                                <option> 1915 </option>
                                                <option> 1916 </option>
                                                <option> 1917 </option>
                                                <option> 1918 </option>
                                                <option> 1919 </option>
                                                <option> 1920 </option>
                                                <option> 1921 </option>
                                                <option> 1922 </option>
                                                <option> 1923 </option>
                                                <option> 1924 </option>
                                                <option> 1925 </option>
                                                <option> 1926 </option>
                                                <option> 1927 </option>
                                                <option> 1928 </option>
                                                <option> 1929 </option>
                                                <option> 1930 </option>
                                                <option> 1931 </option>
                                                <option> 1932 </option>
                                                <option> 1933 </option>
                                                <option> 1934 </option>
                                                <option> 1935 </option>
                                                <option> 1936 </option>
                                                <option> 1937 </option>
                                                <option> 1938 </option>
                                                <option> 1939 </option>
                                                <option> 1940 </option>
                                                <option> 1941 </option>
                                                <option> 1942 </option>
                                                <option> 1943 </option>
                                                <option> 1944 </option>
                                                <option> 1945 </option>
                                                <option> 1946 </option>
                                                <option> 1947 </option>
                                                <option> 1948 </option>
                                                <option> 1949 </option>
                                                <option> 1950 </option>
                                                <option> 1951 </option>
                                                <option> 1952 </option>
                                                <option> 1953 </option>
                                                <option> 1954 </option>
                                                <option> 1955 </option>
                                                <option> 1956 </option>
                                                <option> 1957 </option>
                                                <option> 1958 </option>
                                                <option> 1959 </option>
                                                <option> 1960 </option>
                                                <option> 1961 </option>
                                                <option> 1962 </option>
                                                <option> 1963 </option>
                                                <option> 1964 </option>
                                                <option> 1965 </option>
                                                <option> 1966 </option>
                                                <option> 1967 </option>
                                                <option> 1968 </option>
                                                <option> 1969 </option>
                                                <option> 1970 </option>
                                                <option> 1971 </option>
                                                <option> 1972 </option>
                                                <option> 1973 </option>
                                                <option> 1974 </option>
                                                <option> 1975 </option>
                                                <option> 1976 </option>
                                                <option> 1977 </option>
                                                <option> 1978 </option>
                                                <option> 1979 </option>
                                                <option> 1980 </option>
                                                <option> 1981 </option>
                                                <option> 1982 </option>
                                                <option> 1983 </option>
                                                <option> 1984 </option>
                                                <option> 1985 </option>
                                                <option> 1986 </option>
                                                <option> 1987 </option>
                                                <option> 1988 </option>
                                                <option> 1989 </option>
                                                <option> 1990 </option>
                                                <option> 1991 </option>
                                                <option> 1992 </option>
                                                <option> 1993 </option>
                                                <option> 1994 </option>
                                                <option> 1995 </option>
                                                <option> 1996 </option>
                                                <option> 1997 </option>
                                                <option> 1998 </option>
                                                <option> 1999 </option>
                                                <option> 2000 </option>
                                                <option> 2001 </option>
                                                <option> 2002 </option>
                                                <option> 2003 </option>
                                                <option> 2004</option>
                                                <option> 2005 </option>
                                                <option> 2006 </option>
                                                <option> 2007 </option>
                                                <option> 2008 </option>
                                                <option> 2009 </option>
                                                <option> 2010 </option>
                                                <option> 2011 </option>
                                                <option> 2012 </option>
                                                <option> 2013 </option>
                                            </html:select>   
                                            <div class="error">
                                                <html:errors property="fechafin"/>
                                            </div>
                                        </fieldset>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <fieldset style="border:none">
                        <div class="botonBusqueda" style="float:left; ">
                            <html:link action="/tratado/gestionar">
                                Ver Todos
                            </html:link>
                        </div>
                        </td>
                        <td>
                            <div style="float: right;">
                                <html:submit value= "Buscar"/>
                            </div>
                        </html:form> 
                        </div>
                </fieldset>
            </div>
        </div>
    </div>
</div>	
