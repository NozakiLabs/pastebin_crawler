CREATE DATABASE uranus_monitor;

CREATE TABLE `uranus_monitor`.`company` (
  `ID_COMPANY` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(100) NOT NULL,
  `PHONE` VARCHAR(30),
  `MANAGER` VARCHAR(58),  
  PRIMARY KEY (`ID_COMPANY`),
  UNIQUE INDEX `ID_COMPANY_UNIQUE` (`ID_COMPANY` ASC)) ENGINE = innodb;

CREATE TABLE `uranus_monitor`.`pastebin_history` (
  `ID_PASTE` INT NOT NULL AUTO_INCREMENT,
  `REF` CHAR(8) NOT NULL,
  `DATETIME` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`ID_PASTE`),
  UNIQUE INDEX `ID_PASTE_UNIQUE` (`ID_PASTE` ASC)) ENGINE = innodb;

CREATE TABLE `uranus_monitor`.`pastebin_rule` (
  `ID_RULE` INT NOT NULL AUTO_INCREMENT,
  `ID_COMPANY` INT NOT NULL,
  `WORD` TEXT NOT NULL,
  `FILTER` LONGTEXT NOT NULL,
  PRIMARY KEY (`ID_RULE`),
  UNIQUE INDEX `ID_RULE_UNIQUE` (`ID_RULE` ASC),
  INDEX `ID_COMPANY_idx` (`ID_COMPANY` ASC),
  CONSTRAINT `FKCOMPANY`
    FOREIGN KEY (`ID_COMPANY`)
    REFERENCES `uranus_monitor`.`company` (`ID_COMPANY`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) ENGINE = innodb;

CREATE TABLE `uranus_monitor`.`pastebin_alert` (
  `ID_PASTEBIN_ALERT` INT NOT NULL AUTO_INCREMENT,
  `ID_COMPANY` INT NOT NULL,
  `CONTENT` LONGTEXT NOT NULL,
  `DATETIME` DATETIME NOT NULL DEFAULT NOW(),
  `STATUS` INT(1) NOT NULL,
  `NOTIFICATION` INT(1) NOT NULL,
  `REF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_PASTEBIN_ALERT`),
  UNIQUE INDEX `ID_PASTEBIN_ALERT_UNIQUE` (`ID_PASTEBIN_ALERT` ASC),
  UNIQUE INDEX `REF` (`REF` ASC),
  INDEX `ID_COMPANY_idx` (`ID_COMPANY` ASC),
  CONSTRAINT `FK_COMPANY`
    FOREIGN KEY (`ID_COMPANY`)
    REFERENCES `uranus_monitor`.`company` (`ID_COMPANY`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) ENGINE = innodb;
   
CREATE TABLE `uranus_monitor`.`bing_rule` (
  `ID_BING_RULE` INT NOT NULL AUTO_INCREMENT,
  `ID_COMPANY` INT NOT NULL,
  `DOMAIN` TEXT(124) NOT NULL,
  PRIMARY KEY (`ID_BING_RULE`),
  UNIQUE INDEX `ID_BING_RULE_UNIQUE` (`ID_BING_RULE` ASC),
  INDEX `ID_COMPANY_idx` (`ID_COMPANY` ASC),
  CONSTRAINT `FK_ID_COMPANY`
    FOREIGN KEY (`ID_COMPANY`)
    REFERENCES `uranus_monitor`.`company` (`ID_COMPANY`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) ENGINE = innodb;

CREATE TABLE `uranus_monitor`.`bing_alert` (
  `ID_BING_ALERT` INT NOT NULL AUTO_INCREMENT,
  `ID_COMPANY` INT NOT NULL,
  `URL` TEXT NOT NULL,
  `DATETIME` DATETIME NOT NULL DEFAULT NOW(),
  `STATUS` INT(1) NOT NULL,
  `NOTIFICATION` INT(1) NOT NULL,
  `REF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_BING_ALERT`),
  UNIQUE INDEX `ID_BING_ALERT_UNIQUE` (`ID_BING_ALERT` ASC),
  UNIQUE INDEX `REF` (`REF` ASC),
  INDEX `ID_COMPANY_idx` (`ID_COMPANY` ASC),
  CONSTRAINT `ID_FK_COMPANY`
    FOREIGN KEY (`ID_COMPANY`)
    REFERENCES `uranus_monitor`.`company` (`ID_COMPANY`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) ENGINE = innodb;