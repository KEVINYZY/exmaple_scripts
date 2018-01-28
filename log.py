#!/usr/bin/env python
# coding: utf-8


def getLogger(name):
	"""
	输入日志信息到文件
	rtype: a Logger object
	"""
	import logging
	logger = logging.getLogger(name)
	logger.setLevel(logging.DEBUG)
	file_handler = logging.FileHandler('log.log')
	formatter = logging.Formatter(
		'%(asctime)s [%(levelname)s] %(filename)s "%(message)s"')
	file_handler.setFormatter(formatter)
	logger.addHandler(file_handler)
	return logger


def getLogger(name):
	"""
	输出日志信息到屏幕
	rtype: a Logger object
	"""
	import logging
	logger = logging.getLogger(name)
	logger.setLevel(logging.DEBUG)
	console_handler = logging.StreamHandler()
	formatter = logging.Formatter(
		'%(asctime)s [%(levelname)s] %(filename)s "%(message)s"')
	console_handler.setFormatter(formatter)
	logger.addHandler(console_handler)
	return logger


if __name__ == '__main__':

	logger = getLogger(__name__)   # <Logger __main__ (DEBUG)>
	logger.debug('hello word!')    # 2018-01-28 17:12:13,176 [INFO] code.py "hello word!"
	logger.info('hello word!')     # 2018-01-28 17:12:13,176 [INFO] code.py "hello word!"