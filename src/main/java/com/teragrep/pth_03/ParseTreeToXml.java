/*
 * Teragrep Data Processing Language Parser Library PTH-03
 * Copyright (C) 2019-2026  Suomen Kanuuna Oy
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://github.com/teragrep/teragrep/blob/main/LICENSE>.
 *
 *
 * Additional permission under GNU Affero General Public License version 3
 * section 7
 *
 * If you modify this Program, or any covered work, by linking or combining it
 * with other code, such other code is not for that reason alone subject to any
 * of the requirements of the GNU Affero GPL version 3 as long as this Program
 * is the same Program as licensed from Suomen Kanuuna Oy without any additional
 * modifications.
 *
 * Supplemented terms under GNU Affero General Public License version 3
 * section 7
 *
 * Origin of the software must be attributed to Suomen Kanuuna Oy. Any modified
 * versions must be marked as "Modified version of" The Program.
 *
 * Names of the licensors and authors may not be used for publicity purposes.
 *
 * No rights are granted for use of trade names, trademarks, or service marks
 * which are in The Program if any.
 *
 * Licensee must indemnify licensors and authors for any liability that these
 * contractual assumptions impose on licensors and authors.
 *
 * To the extent this program is licensed as part of the Commercial versions of
 * Teragrep, the applicable Commercial License may apply to this file if you as
 * a licensee so wish it.
 */
package com.teragrep.pth_03;

import com.teragrep.pth_03.antlr.DPLParser;
import com.teragrep.pth_03.antlr.DPLParserBaseListener;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import static org.antlr.v4.runtime.tree.ParseTreeWalker.DEFAULT;

public class ParseTreeToXml {
    Document doc = null;

    public ParseTreeToXml(DPLParser parser, ParseTree tree) throws ParserConfigurationException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        doc = builder.newDocument();
        //System.out.println("Init ParseTree using ParseTreeWalker:");
        List<Element> retval = new ArrayList<>();
        DEFAULT.walk(new DPLParserBaseListener() {
            final String INDENT = "    ";
            int level = 0;
            Element current = null;

            @Override
            public void enterEveryRule(final ParserRuleContext ctx) {
                String elementTag = parser.getRuleNames()[ctx.getRuleIndex()];
                ++level;
                Element el = doc.createElement(elementTag);
                // step deeper
                if (current == null ){
                    doc.appendChild(el);
                } else {
                    current.appendChild(el);
                }
                current = el;
                super.enterEveryRule(ctx);
            }

            @Override
            public void exitEveryRule(final ParserRuleContext ctx) {
                --level;
                super.exitEveryRule(ctx);
                if(level>0) {
                    current = (Element) current.getParentNode();
                } else {
                    // Back to root level, clear current.
                    current = null;
                }
            }

            @Override
            public void visitTerminal(final TerminalNode node) {
                final String value = node.getText();

                if (!value.matches("\\s+")) {
                    String terminal = node.getText();
                    Element el = null;
                    if (terminal.equals("<EOF>")) {
                        // Set terminal instead of value
                        el = doc.createElement("EOF");
                    }else {
                        el = doc.createElement("value");
                        el.setTextContent(terminal);
                    }
                    current.appendChild(el);
                }
                super.visitTerminal(node);
            }

        }, tree);
        // After this, doc contains DOM representation and toString uses transformer to represent it as string
    }

    public Document asDomDocument(){
        return doc;
    }

    // xml-util
    public static String elementAsString(Element el) {
        String str = null;
        try {
            TransformerFactory transFactory = TransformerFactory.newInstance();
            Transformer transformer = transFactory.newTransformer();
            StringWriter buffer = new StringWriter();
            transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.transform(new DOMSource(el),
                    new StreamResult(buffer));
            str = buffer.toString();
        } catch (TransformerConfigurationException tex) {
        } catch (TransformerException ex) {
        }
        return str;
    }

    // Return DOM as XML-string using transformer
    public final String toString() {
        Transformer tf = null;
        try {
            tf = TransformerFactory.newInstance().newTransformer();
            tf.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
            tf.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
            tf.setOutputProperty(OutputKeys.INDENT, "yes");
            tf.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
            Writer out = new StringWriter();
            tf.transform(new DOMSource(doc), new StreamResult(out));
            return out.toString();
        } catch (TransformerConfigurationException e) {
            e.printStackTrace();
        } catch (TransformerException e) {
            e.printStackTrace();
        }
        return null;
    }
}