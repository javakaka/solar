package com.ezcloud.framework.service.system;

import java.io.IOException;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import com.ezcloud.framework.common.Setting;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.util.SettingUtils;

/**   
 * @author shike001 
 * E-mail:510836102@qq.com   
 * @version 创建时间：2014-12-31 下午5:35:10  
 * 类说明: 
 */
@Component("frameworkSystemMailService")
public class SystemMailService extends Service {
	
	@Resource(name = "javaMailSender")
	private JavaMailSenderImpl javaMailSender;
	
	public SystemMailService() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * 发送模板邮件
	 * 
	 * @param smtpFromMail
	 *            发件人邮箱
	 * @param smtpHost
	 *            SMTP服务器地址
	 * @param smtpPort
	 *            SMTP服务器端口
	 * @param smtpUsername
	 *            SMTP用户名
	 * @param smtpPassword
	 *            SMTP密码
	 * @param toMail
	 *            收件人邮箱
	 * @param subject
	 *            主题
	 * @param model
	 *            数据
	 * @param async
	 *            是否异步
	 */
	public void send(String smtpFromMail, String smtpHost, Integer smtpPort, 
			String smtpUsername, String smtpPassword, String toMail, 
			String subject, Map<String, Object> model, boolean async)
	{
		Assert.hasText(smtpFromMail);
		Assert.hasText(smtpHost);
		Assert.notNull(smtpPort);
		Assert.hasText(smtpUsername);
		Assert.hasText(smtpPassword);
		Assert.hasText(toMail);
		Assert.hasText(subject);
		
		System.out.println("smtpFromMail:"+smtpFromMail+">smtpHost"+smtpHost+">smtpPort"+smtpPort);
		System.out.println("smtpUsername:"+smtpUsername+">smtpPassword"+smtpPassword);
		System.out.println("toMail:"+toMail+">subject"+subject);
		try {
			Setting setting = SettingUtils.get();
			Random random =new Random();
			int randomNumber =random.nextInt(899999);
			randomNumber =100000+randomNumber;
			String text ="您的新密码是："+String.valueOf(randomNumber);
			javaMailSender.setHost(smtpHost);
//			javaMailSender.setPort(smtpPort);
			javaMailSender.setUsername(smtpUsername);
			javaMailSender.setPassword(smtpPassword);
			MimeMessage mimeMessage = javaMailSender.createMimeMessage();
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "utf-8");
			mimeMessageHelper.setFrom(MimeUtility.encodeWord(setting.getSiteName()) + " <" + smtpFromMail + ">");
			mimeMessageHelper.setSubject(subject);
			mimeMessageHelper.setTo(toMail);
			mimeMessageHelper.setText(text, true);
			javaMailSender.send(mimeMessage);
		}  catch (IOException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	public void send(String smtpFromMail, String smtpHost, Integer smtpPort, 
			String smtpUsername, String smtpPassword, String toMail, 
			String subject, Map<String, Object> model, boolean async,String content)
	{
		Assert.hasText(smtpFromMail);
		Assert.hasText(smtpHost);
		Assert.notNull(smtpPort);
		Assert.hasText(smtpUsername);
		Assert.hasText(smtpPassword);
		Assert.hasText(toMail);
		Assert.hasText(subject);
		
		System.out.println("smtpFromMail:"+smtpFromMail+">smtpHost"+smtpHost+">smtpPort"+smtpPort);
		System.out.println("smtpUsername:"+smtpUsername+">smtpPassword"+smtpPassword);
		System.out.println("toMail:"+toMail+">subject"+subject);
		try {
			Setting setting = SettingUtils.get();
			
			javaMailSender.setHost(smtpHost);
//			javaMailSender.setPort(smtpPort);
			javaMailSender.setUsername(smtpUsername);
			javaMailSender.setPassword(smtpPassword);
			MimeMessage mimeMessage = javaMailSender.createMimeMessage();
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "utf-8");
			mimeMessageHelper.setFrom(MimeUtility.encodeWord(setting.getSiteName()) + " <" + smtpFromMail + ">");
			mimeMessageHelper.setSubject(subject);
			mimeMessageHelper.setTo(toMail);
			mimeMessageHelper.setText(content, true);
			javaMailSender.send(mimeMessage);
		}  catch (IOException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
