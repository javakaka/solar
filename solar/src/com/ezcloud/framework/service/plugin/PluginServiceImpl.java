package com.ezcloud.framework.service.plugin;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Predicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezcloud.framework.plugin.StoragePlugin;

/**
 * Service - 插件
 */
@Service("frameworkPluginServiceImpl")
public class PluginServiceImpl implements PluginService {

//	@Resource
//	private List<PaymentPlugin> paymentPlugins = new ArrayList<PaymentPlugin>();
//	@Resource
	@Autowired
	private List<StoragePlugin> storagePlugins = new ArrayList<StoragePlugin>();
//	@Resource
//	private Map<String, PaymentPlugin> paymentPluginMap = new HashMap<String, PaymentPlugin>();
	@Resource
	private Map<String, StoragePlugin> storagePluginMap = new HashMap<String, StoragePlugin>();

//	public List<PaymentPlugin> getPaymentPlugins() {
//		Collections.sort(paymentPlugins);
//		return paymentPlugins;
//	}

	public List<StoragePlugin> getStoragePlugins() {
		Collections.sort(storagePlugins);
		return storagePlugins;
	}

//	public List<PaymentPlugin> getPaymentPlugins(final boolean isEnabled) {
//		System.out.println("get payment plugins .....");
//		List<PaymentPlugin> result = new ArrayList<PaymentPlugin>();
//		CollectionUtils.select(paymentPlugins, new Predicate() {
//			public boolean evaluate(Object object) {
//				PaymentPlugin paymentPlugin = (PaymentPlugin) object;
//				return paymentPlugin.getIsEnabled() == isEnabled;
//			}
//		}, result);
//		Collections.sort(result);
//		System.out.println(" payment plugins have produced ... then we list them");
//		for(int i=0; i< result.size();i++)
//		{
//			System.out.println("result number....."+((PaymentPlugin)result.get(i)).getId());
//		}
//		return result;
//	}

	public List<StoragePlugin> getStoragePlugins(final boolean isEnabled) {
		List<StoragePlugin> result = new ArrayList<StoragePlugin>();
		CollectionUtils.select(storagePlugins, new Predicate() {
			public boolean evaluate(Object object) {
				StoragePlugin storagePlugin = (StoragePlugin) object;
				return storagePlugin.getIsEnabled() == isEnabled;
			}
		}, result);
		Collections.sort(result);
		return result;
	}

//	public PaymentPlugin getPaymentPlugin(String id) {
//		return paymentPluginMap.get(id);
//	}

	public StoragePlugin getStoragePlugin(String id) {
		return storagePluginMap.get(id);
	}

}