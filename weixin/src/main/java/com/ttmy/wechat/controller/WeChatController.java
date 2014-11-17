package com.ttmy.wechat.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.sd4324530.fastweixin.handle.EventHandle;
import com.github.sd4324530.fastweixin.handle.MessageHandle;
import com.github.sd4324530.fastweixin.message.BaseMsg;
import com.github.sd4324530.fastweixin.message.TextMsg;
import com.github.sd4324530.fastweixin.message.req.TextReqMsg;
import com.github.sd4324530.fastweixin.servlet.WeixinControllerSupport;

@Controller
@RequestMapping("/wechat")
public class WeChatController extends WeixinControllerSupport {
	private static final Logger log = LoggerFactory
			.getLogger(WeChatController.class);
	private static final String TOKEN = "myToken";

	// 设置TOKEN，用于绑定微信服务器
	@Override
	protected String getToken() {
		return TOKEN;
	}

	// 处理对应的微信消息
	@Override
	protected BaseMsg handleTextMsg(TextReqMsg msg) {
		String content = msg.getContent();
		log.debug("用户发送到服务器的内容:{}", content);
		return new TextMsg("服务器回复用户消息!");
	}

	/*
	 * 加入自定义微信消息处理器，只处理指定的那部分消息
	 */
	@Override
	protected List<MessageHandle> getMessageHandles() {
		List<MessageHandle> handles = new ArrayList<MessageHandle>();
		// handles.add(new MyMessageHandle());
		return handles;
	}

	// 加入自定义微信事件处理器
	@Override
	protected List<EventHandle> getEventHandles() {
		List<EventHandle> handles = new ArrayList<EventHandle>();
		// handles.add(new MyEventHandle());
		return handles;
	}
}
