package br.com.rectius.crm.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.messaging.MessageTemplate;
import flex.messaging.messages.AsyncMessage;

/**
Description : Example of implementing Data Push to sychronize data 
on multiple clients using Flex, BlazeDS, the Spring BlazeDS Integration,
and Hibernate.

Author: Bigyan Basnet

@author      Bigyan Basnet
@date        July 10, 2009
@version     1.0
@site        riacentric.com
**/
public class MessagingDAO {
	
	private MessageTemplate template;


	public MessageTemplate getTemplate() {
		return template;
	}
	@Autowired
	public void setTemplate(MessageTemplate template) {
		this.template = template;
	}
	
	public void sendMessage(String destination, String headerName, 
			String headerValue, Object body) {
		AsyncMessage message = template.createMessage();
        message.setDestination(destination);
        message.setBody(body);
        message.setHeader(headerName, headerValue);
        template.getMessageBroker().routeMessageToService(message, null);		
	}

}
