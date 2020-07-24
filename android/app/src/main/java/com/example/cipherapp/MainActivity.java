package com.example.cipherapp;

import android.graphics.Point;
import android.os.Bundle;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "flutter.native/helper";
    List<String> temp = new ArrayList();
    List<String> temp1 = new ArrayList();
    List<String> temp2 = new ArrayList();
    List<String> temp3 = new ArrayList();
    private static char[][] charTable;
    private static Point[] positions;
    String keyString;
    int keyInt;
    String message;
    int a, b;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(getFlutterEngine());
        new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        if (call.method.equals("caesar")) {
                            temp = call.argument("temp");
                            keyInt = Integer.parseInt(temp.get(0));
                            message = temp.get(1);
                            String greetings = encrypt(message, keyInt);
                            result.success(greetings);
                        }
                        else if (call.method.equals("playfair")) {
                            temp1 = call.argument("temp1");
                            keyString = temp1.get(0);
                            message = temp1.get(1);
                            String greetings = encode(prepareText(message), keyString);
                            result.success(greetings);
                        }
                        else if (call.method.equals("vigenere")) {
                            temp2 = call.argument("temp2");
                            keyString = temp2.get(0).toUpperCase();
                            message = temp2.get(1).toUpperCase();
                            String greetings = cipherText(message, keyString);
                            result.success(greetings);
                        }
                        else if (call.method.equals("affine")) {
                            temp3 = call.argument("temp3");
                            message = temp3.get(0).toUpperCase().toUpperCase();
                            a = Integer.parseInt(temp3.get(1));
                            b = Integer.parseInt(temp3.get(2));
                            String greetings = encryptMessage(message.toCharArray(), a, b);
                            result.success(greetings);
                        }
                    }});
    }



    public static String encrypt(String text, int s) {
        StringBuffer result= new StringBuffer();

        for (int i=0; i<text.length(); i++)
        {
            if (Character.isUpperCase(text.charAt(i)))
            {
                char ch = (char)(((int)text.charAt(i) +
                        s - 65) % 26 + 65);
                result.append(ch);
            }
            else
            {
                char ch = (char)(((int)text.charAt(i) +
                        s - 97) % 26 + 97);
                result.append(ch);
            }
        }
        return result.toString();
    }



    private static String encode(String s, String key) {

        createTable(key);

        StringBuilder sb = new StringBuilder(s);

        for (int i = 0; i < sb.length(); i += 2) {

            if (i == sb.length() - 1)
                sb.append(sb.length() % 2 == 1 ? 'X' : "");

            else if (sb.charAt(i) == sb.charAt(i + 1))
                sb.insert(i + 1, 'X');
        }
        return codec(sb, 1);
    }


    private static void createTable(String key) {
        charTable = new char[5][5];
        positions = new Point[26];

        String s = prepareText(key + "ABCDEFGHIJKLMNOPQRSTUVWXYZ");

        int len = s.length();
        for (int i = 0, k = 0; i < len; i++) {
            char c = s.charAt(i);
            if (positions[c - 'A'] == null) {
                charTable[k / 5][k % 5] = c;
                positions[c - 'A'] = new Point(k % 5, k / 5);
                k++;
            }
        }
    }


    private static String prepareText(String s) {
        s = s.toUpperCase().replaceAll("[^A-Z]", "");
        return s.replace("J", "I");
    }


    private static String codec(StringBuilder text, int direction) {
        int len = text.length();
        for (int i = 0; i < len; i += 2) {
            char a = text.charAt(i);
            char b = text.charAt(i + 1);

            int row1 = positions[a - 'A'].y;
            int row2 = positions[b - 'A'].y;
            int col1 = positions[a - 'A'].x;
            int col2 = positions[b - 'A'].x;

            if (row1 == row2) {
                col1 = (col1 + direction) % 5;
                col2 = (col2 + direction) % 5;

            } else if (col1 == col2) {
                row1 = (row1 + direction) % 5;
                row2 = (row2 + direction) % 5;

            } else {
                int tmp = col1;
                col1 = col2;
                col2 = tmp;
            }

            text.setCharAt(i, charTable[row1][col1]);
            text.setCharAt(i + 1, charTable[row2][col2]);
        }
        return text.toString();

    }


    static String cipherText(String str, String keyword)
    {

        String key = generateKey(str, keyword);
        String cipher_text="";

        for (int i = 0; i < str.length(); i++)
        {
            // converting in range 0-25
            int x = (str.charAt(i) + key.charAt(i)) %26;

            // convert into alphabets(ASCII)
            x += 'A';

            cipher_text+=(char)(x);
        }
        return cipher_text;
    }


    static String generateKey(String str, String key)
    {
        int x = str.length();

        for (int i = 0; ; i++)
        {
            if (x == i)
                i = 0;
            if (key.length() == str.length())
                break;
            key+=(key.charAt(i));
        }
        return key;
    }



    static String encryptMessage(char[] msg, int a, int b)
    {
        /// Cipher Text initially empty
        String cipher = "";
        for (int i = 0; i < msg.length; i++)
        {
            // Avoid space to be encrypted
            /* applying encryption formula ( a x + b ) mod m
            {here x is msg[i] and m is 26} and added 'A' to
            bring it in range of ascii alphabet[ 65-90 | A-Z ] */
            if (msg[i] != ' ')
            {
                cipher = cipher
                        + (char) ((((a * (msg[i] - 'A')) + b) % 26) + 'A');
            } else // else simply append space character
            {
                cipher += msg[i];
            }
        }
        return cipher;
    }

}
