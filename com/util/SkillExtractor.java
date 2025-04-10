package com.util;

import java.io.File;
import java.io.IOException;
import java.util.*;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

public class SkillExtractor {

    // Sample skill keywords list (you can expand this)
    private static final List<String> SKILL_KEYWORDS = Arrays.asList(
        "Java", "HTML", "CSS", "JavaScript", "Python", "MySQL", "Spring", "React", "JSP", "Node.js"
    );

    public static List<String> extractSkills(String filePath) {
        List<String> matchedSkills = new ArrayList<>();

        try (PDDocument document = PDDocument.load(new File(filePath))) {
            PDFTextStripper stripper = new PDFTextStripper();
            String content = stripper.getText(document).toLowerCase();

            for (String skill : SKILL_KEYWORDS) {
                if (content.contains(skill.toLowerCase())) {
                    matchedSkills.add(skill);
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return matchedSkills;
    }
}
